#include "llvm/IR/Attributes.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <memory>
#include <set>
#include <string>
#include <vector>

using namespace llvm;

static int usage() {
  errs() << "Usage:\n  app_ir_gen instrument input.ll profile.ll\n"
            "  app_ir_gen prune input.ll called_ids.txt generated.ll\n";
  return 2;
}

static bool writeIR(Module &M, const std::string &path) {
  std::error_code EC;
  raw_fd_ostream Out(path, EC, sys::fs::OF_Text);
  if (EC) { errs() << "Cannot write " << path << ": " << EC.message() << "\n"; return false; }
  M.print(Out, nullptr);
  Out.flush();
  return true;
}

int main(int argc, char **argv) {
  if ((argc != 4 && argc != 5) || argc < 2) return usage();
  const std::string mode = argv[1];
  if ((mode == "instrument" && argc != 4) || (mode == "prune" && argc != 5)) return usage();
  if (mode != "instrument" && mode != "prune") return usage();

  LLVMContext Ctx;
  SMDiagnostic Diag;
  auto M = parseIRFile(argv[2], Diag, Ctx);
  if (!M) { Diag.print(argv[0], errs()); return 1; }
  Function *App = M->getFunction("app");
  if (!App || App->isDeclaration() || !App->getReturnType()->isVoidTy() || App->arg_size() != 0) {
    errs() << "Expected a definition: void app(void)\n";
    return 1;
  }

  std::vector<Function *> Defs;
  for (Function &F : *M)
    if (!F.isDeclaration() && !F.isIntrinsic()) Defs.push_back(&F);

  if (mode == "instrument") {
    auto *VoidTy = Type::getVoidTy(Ctx);
    auto *I32 = Type::getInt32Ty(Ctx);
    FunctionCallee Hook = M->getOrInsertFunction("__irgen_hit", VoidTy, I32);
    for (unsigned i = 0; i < Defs.size(); ++i) {
      Function *F = Defs[i];
      F->removeFnAttr(Attribute::Memory);
      F->removeFnAttr(Attribute::NoSync);
      F->removeFnAttr(Attribute::NoFree);
      F->removeFnAttr(Attribute::Speculatable);
      IRBuilder<> B(&*F->getEntryBlock().getFirstInsertionPt());
      B.CreateCall(Hook, {ConstantInt::get(I32, i)});
      outs() << i << "\t" << F->getName() << "\n";
    }
    if (verifyModule(*M, &errs())) return 1;
    if (!writeIR(*M, argv[3])) return 1;
    outs() << "Created function-entry instrumented IR: " << argv[3] << "\n";
    return 0;
  }

  // `prune` is based on actual runtime observations, not only static reachability.
  // Unseen functions are only removed if no retained function references them;
  // otherwise we fail rather than generate a silently incomplete module.
  std::ifstream In(argv[3]);
  if (!In) { errs() << "Cannot open observed IDs: " << argv[3] << "\n"; return 1; }
  std::set<unsigned> Observed;
  unsigned id;
  while (In >> id) Observed.insert(id);
  bool sawApp = false;
  for (unsigned i = 0; i < Defs.size(); ++i)
    if (Defs[i] == App && Observed.count(i)) sawApp = true;
  if (!sawApp) { errs() << "Profile did not execute app(); aborting\n"; return 1; }

  for (unsigned i = 0; i < Defs.size(); ++i) {
    if (Observed.count(i)) {
      outs() << "KEEP " << Defs[i]->getName() << "\n";
    } else {
      outs() << "DROP " << Defs[i]->getName() << "\n";
      Defs[i]->deleteBody();
    }
  }
  for (unsigned i = 0; i < Defs.size(); ++i) {
    if (Observed.count(i)) continue;
    if (!Defs[i]->use_empty()) {
      errs() << "ERROR: " << Defs[i]->getName()
             << " was not observed but is still referenced by retained IR.\n"
             << "Increase IRGEN_FRAMES or avoid this profile-driven pruning.\n";
      return 1;
    }
  }
  for (unsigned i = 0; i < Defs.size(); ++i)
    if (!Observed.count(i)) Defs[i]->eraseFromParent();

  Function *Entry = Function::Create(FunctionType::get(Type::getVoidTy(Ctx), false),
                                     GlobalValue::ExternalLinkage, "generated_entry", M.get());
  BasicBlock *BB = BasicBlock::Create(Ctx, "entry", Entry);
  IRBuilder<> B(BB);
  B.CreateCall(App);
  B.CreateRetVoid();

  if (verifyModule(*M, &errs())) return 1;
  if (!writeIR(*M, argv[4])) return 1;
  outs() << "Generated app-only IR: " << argv[4] << "\n";
  return 0;
}
