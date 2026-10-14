#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include <set>
#include <vector>

using namespace llvm;

namespace {
class TraceEdgesPass : public PassInfoMixin<TraceEdgesPass> {
public:
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    Function *App = M.getFunction("app");
    if (!App || App->isDeclaration()) {
      errs() << "trace-edges: function app() not found\n";
      return PreservedAnalyses::all();
    }

    LLVMContext &Ctx = M.getContext();
    Type *VoidTy = Type::getVoidTy(Ctx);
    Type *I32Ty = Type::getInt32Ty(Ctx);
    Type *PtrTy = PointerType::getUnqual(Ctx);

    FunctionCallee Record = M.getOrInsertFunction(
        "__trace_edge", FunctionType::get(VoidTy, {I32Ty, I32Ty}, false));
    FunctionCallee Register = M.getOrInsertFunction(
        "__trace_register_opcode",
        FunctionType::get(VoidTy, {I32Ty, PtrTy}, false));
    FunctionCallee FrameEnd = M.getOrInsertFunction(
        "__trace_after_flush", FunctionType::get(VoidTy, {}, false));

    // Snapshot BEFORE modifying IR so that inserted calls aren't traced.
    std::vector<Instruction *> Work;
    std::set<unsigned> SeenOpCodes;
    for (Function &F : M) {
      if (F.isDeclaration())
        continue;
      for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
          Work.push_back(&I);
          SeenOpCodes.insert(I.getOpcode());
        }
      }
    }

    uint64_t StaticEdges = 0;
    unsigned Flushes = 0;
    for (Instruction *I : Work) {
      if (!isa<PHINode>(I)) {
        IRBuilder<> B(I);
        for (Use &U : I->operands()) {
          if (auto *Def = dyn_cast<Instruction>(U.get())) {
            B.CreateCall(Record,
                         {ConstantInt::get(I32Ty, I->getOpcode()),
                          ConstantInt::get(I32Ty, Def->getOpcode())});
            ++StaticEdges;
          }
        }
      }

      if (auto *CI = dyn_cast<CallInst>(I)) {
        Function *Callee = CI->getCalledFunction();
        if (Callee && Callee->getName() == "simFlush") {
          IRBuilder<> After(CI->getNextNode());
          After.CreateCall(FrameEnd);
          ++Flushes;
        }
      }
    }

    auto Entry = App->getEntryBlock().getFirstInsertionPt();
    IRBuilder<> Init(&*Entry);
    for (unsigned Code : SeenOpCodes) {
      Value *Name = Init.CreateGlobalStringPtr(
          Instruction::getOpcodeName(Code), "trace.opcode");
      Init.CreateCall(Register, {ConstantInt::get(I32Ty, Code), Name});
    }

    errs() << "trace-edges: instrumented " << StaticEdges
           << " static User<-Operand edges, " << SeenOpCodes.size()
           << " opcodes and " << Flushes << " flush call sites\n";
    return PreservedAnalyses::none();
  }
};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "TraceEdges", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name != "trace-edges")
                    return false;
                  MPM.addPass(TraceEdgesPass());
                  return true;
                });
          }};
}
