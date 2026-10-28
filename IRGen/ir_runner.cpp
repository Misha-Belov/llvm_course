#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/DynamicLibrary.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <memory>
#include <set>
#include <string>

using namespace llvm;

#ifndef IRGEN_HEADLESS
extern "C" {
  void simInit(void);
  void simExit(void);
  void simFlush(void);
  void simPutPixel(int, int, int);
  int simRand(void);
}
#endif

static int gFrames = 0;
static int gMaxFrames = 2;
static std::FILE *gCallFile = nullptr;
static std::set<int> gCalledIds;

extern "C" void __irgen_hit(int id) {
  if (gCallFile && gCalledIds.insert(id).second) {
    std::fprintf(gCallFile, "%d\n", id);
    std::fflush(gCallFile);
  }
}

extern "C" void irgenPutPixel(int x, int y, int argb) {
#ifndef IRGEN_HEADLESS
  simPutPixel(x, y, argb);
#else
  (void)x; (void)y; (void)argb;
#endif
}
extern "C" int irgenRand(void) {
#ifndef IRGEN_HEADLESS
  return simRand();
#else
  return std::rand();
#endif
}
extern "C" void irgenFlush(void) {
#ifndef IRGEN_HEADLESS
  simFlush();
#endif
  ++gFrames;
  std::fprintf(stderr, "[ExecutionEngine] frame %d completed\n", gFrames);
  if (gMaxFrames > 0 && gFrames >= gMaxFrames) {
    std::fprintf(stderr, "[ExecutionEngine] finished after %d frames\n", gFrames);
    std::exit(0);
  }
}

static unsigned lowerIntegerMinMaxIntrinsics(Module &M) {
  SmallVector<IntrinsicInst *, 32> Worklist;
  for (Function &F : M) {
    if (F.isDeclaration()) continue;
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        if (auto *II = dyn_cast<IntrinsicInst>(&I)) {
          switch (II->getIntrinsicID()) {
          case Intrinsic::smin:
          case Intrinsic::smax:
          case Intrinsic::umin:
          case Intrinsic::umax:
            Worklist.push_back(II);
            break;
          default:
            break;
          }
        }
      }
    }
  }

  for (IntrinsicInst *II : Worklist) {
    IRBuilder<> B(II);
    Value *A = II->getArgOperand(0);
    Value *C = II->getArgOperand(1);
    Value *Cmp = nullptr;

    switch (II->getIntrinsicID()) {
    case Intrinsic::smin: Cmp = B.CreateICmpSLT(A, C); break;
    case Intrinsic::smax: Cmp = B.CreateICmpSGT(A, C); break;
    case Intrinsic::umin: Cmp = B.CreateICmpULT(A, C); break;
    case Intrinsic::umax: Cmp = B.CreateICmpUGT(A, C); break;
    default: llvm_unreachable("unexpected min/max intrinsic");
    }

    Value *Replacement = B.CreateSelect(Cmp, A, C, "interp.minmax");
    II->replaceAllUsesWith(Replacement);
    II->eraseFromParent();
  }
  return Worklist.size();
}

static void setupBackend() {
#ifdef IRGEN_HEADLESS
  std::srand(1);
#else
  simInit();
  std::atexit(simExit);
#endif
}

static void mapHostFunction(ExecutionEngine &EE, Module &M,
                            const char *Name, void *HostAddress) {
  sys::DynamicLibrary::AddSymbol(Name, HostAddress);
  if (Function *F = M.getFunction(Name)) {
    if (!F->isDeclaration()) {
      errs() << "Refusing to override an IR definition: " << Name << "\n";
      std::exit(2);
    }
    EE.addGlobalMapping(F, HostAddress);
  }
}

static int usage() {
  std::fprintf(stderr, "Usage: ir_runner_{headless,sdl} interp|jit app.ll\n"
                       "  IRGEN_FRAMES=2        stop after two simFlush calls\n"
                       "  IRGEN_CALLED=path     record executed function IDs\n");
  return 2;
}

int main(int argc, char **argv) {
  if (argc != 3) return usage();
  std::string Engine = argv[1];
  if (Engine != "interp" && Engine != "jit") return usage();

  const char *EnvFrames = std::getenv("IRGEN_FRAMES");
  if (EnvFrames) gMaxFrames = std::atoi(EnvFrames);
  if (gMaxFrames <= 0) {
    std::fprintf(stderr, "IRGEN_FRAMES must be > 0 for infinite app()\n");
    return 2;
  }
  if (const char *OutPath = std::getenv("IRGEN_CALLED")) {
    gCallFile = std::fopen(OutPath, "w");
    if (!gCallFile) { std::perror(OutPath); return 1; }
    std::atexit([] { if (gCallFile) std::fclose(gCallFile); });
  }

  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  LLVMContext Ctx;
  SMDiagnostic Diag;
  std::unique_ptr<Module> M = parseIRFile(argv[2], Diag, Ctx);
  if (!M) { Diag.print(argv[0], errs()); return 1; }
  if (Engine == "interp") {
    unsigned N = lowerIntegerMinMaxIntrinsics(*M);
    errs() << "[Interpreter] lowered " << N
           << " integer min/max intrinsics to icmp/select\n";
  }
  if (verifyModule(*M, &errs())) return 1;

  Function *Entry = M->getFunction("generated_entry");
  if (!Entry) Entry = M->getFunction("app"); // profiling input
  if (!Entry || Entry->isDeclaration()) {
    errs() << "Neither defined generated_entry() nor app() found\n";
    return 1;
  }
  if (!Entry->arg_empty() || !Entry->getReturnType()->isVoidTy()) {
    errs() << "Expected void entry() with no arguments\n";
    return 1;
  }
  Module *Raw = M.get();
  std::string Err;
  EngineBuilder Builder(std::move(M));
  Builder.setEngineKind(Engine == "interp" ? EngineKind::Interpreter : EngineKind::JIT);
  Builder.setErrorStr(&Err);
  std::unique_ptr<ExecutionEngine> EE(Builder.create());
  if (!EE) { errs() << "ExecutionEngine failed: " << Err << "\n"; return 1; }

  mapHostFunction(*EE, *Raw, "simPutPixel", reinterpret_cast<void *>(&irgenPutPixel));
  mapHostFunction(*EE, *Raw, "simFlush",    reinterpret_cast<void *>(&irgenFlush));
  mapHostFunction(*EE, *Raw, "simRand",     reinterpret_cast<void *>(&irgenRand));
  mapHostFunction(*EE, *Raw, "__irgen_hit", reinterpret_cast<void *>(&__irgen_hit));

  setupBackend();
  errs() << "Running " << Entry->getName() << " via " << Engine
         << " with native graphic callbacks\n";
  if (Engine == "jit") {
    EE->finalizeObject();
    auto Address = EE->getFunctionAddress(Entry->getName().str());
    if (!Address) { errs() << "JIT function address not found\n"; return 1; }
    reinterpret_cast<void (*)()>(static_cast<uintptr_t>(Address))();
  } else {
    EE->runFunction(Entry, {});
  }
  return 0;
}
