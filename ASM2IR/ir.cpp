#include "isa.h"
#include "runtime.h"
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/MCJIT.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <memory>
#include <stdexcept>
#include <utility>

void executeIR(const Program &program, Machine &machine, bool external, const std::string &dump) {
    using namespace llvm;
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();
    LLVMContext context;
    auto module = std::make_unique<Module>(external ? "wave.external" : "wave.full", context);
    IRBuilder<> ir(context);
    auto *i32 = ir.getInt32Ty();
    auto *ptr = ir.getPtrTy();
    auto *entry = Function::Create(FunctionType::get(ir.getVoidTy(), {ptr, ptr}, false),
                                   Function::ExternalLinkage, "wave_main", *module);
    Value *regs = entry->getArg(0), *memory = entry->getArg(1);
    regs->setName("registers"); memory->setName("memory");
    std::vector<BasicBlock *> blocks;
    for (size_t i = 0; i <= program.size(); ++i)
        blocks.push_back(BasicBlock::Create(context, "pc" + std::to_string(i), entry));
    auto constant = [&](uint32_t n) { return ir.getInt32(n); };
    auto regPointer = [&](unsigned n) { return ir.CreateGEP(i32, regs, constant(n)); };
    auto read = [&](Operand operand) -> Value * {
        if (operand.reg) return ir.CreateLoad(i32, regPointer(operand.value));
        return constant(operand.value);
    };
    std::vector<std::pair<Function *, void *>> mappings;
    auto host = [&](const std::string &name, FunctionType *type, void *address) {
        auto callee = module->getOrInsertFunction(name, type);
        mappings.emplace_back(cast<Function>(callee.getCallee()), address);
        return callee;
    };
    auto randFunction = host("waveRand", FunctionType::get(i32, false), reinterpret_cast<void *>(&waveRand));
    auto flushFunction = host("waveFlush", FunctionType::get(i32, false), reinterpret_cast<void *>(&waveFlush));
    auto pixelFunction = host("wavePixel", FunctionType::get(ir.getVoidTy(), {i32, i32, i32}, false), reinterpret_cast<void *>(&wavePixel));
    auto faultFunction = host("waveFault", FunctionType::get(ir.getVoidTy(), {i32}, false), reinterpret_cast<void *>(&waveFault));
    cast<Function>(faultFunction.getCallee())->addFnAttr(Attribute::NoReturn);
    auto guard = [&](Value *invalid, uint32_t code) {
        auto *bad = BasicBlock::Create(context, "fault", entry);
        auto *good = BasicBlock::Create(context, "checked", entry);
        ir.CreateCondBr(invalid, bad, good);
        ir.SetInsertPoint(bad);
        ir.CreateCall(faultFunction, {constant(code)});
        ir.CreateUnreachable();
        ir.SetInsertPoint(good);
    };
    auto division = [&](Value *a, Value *b, bool remainder) -> Value * {
        auto *zero = ir.CreateICmpEQ(b, constant(0));
        auto *overflow = ir.CreateAnd(ir.CreateICmpEQ(a, constant(0x80000000u)),
                                      ir.CreateICmpEQ(b, constant(0xffffffffu)));
        guard(ir.CreateOr(zero, overflow), 2);
        return remainder ? ir.CreateSRem(a, b) : ir.CreateSDiv(a, b);
    };
    for (size_t pc = 0; pc < program.size(); ++pc) {
        ir.SetInsertPoint(blocks[pc]);
        const auto &inst = program[pc];
        const auto &op = Operations[inst.op];
        std::string name = op.name;
        Value *v[3] = {constant(0), constant(0), constant(0)};
        for (unsigned i = 0; i < op.values; ++i) v[i] = read(inst.args[i]);
        auto *a = v[0], *b = v[1], *c = v[2];
        if (op.branch) {
            if (name == "JMP") ir.CreateBr(blocks[inst.target]);
            else {
                Value *condition = nullptr;
                if (name == "BEQ") condition = ir.CreateICmpEQ(a, b);
                if (name == "BNE") condition = ir.CreateICmpNE(a, b);
                if (name == "BLT") condition = ir.CreateICmpSLT(a, b);
                if (name == "BLE") condition = ir.CreateICmpSLE(a, b);
                ir.CreateCondBr(condition, blocks[inst.target], blocks[pc + 1]);
            }
            continue;
        }
        if (name == "HALT") { ir.CreateRetVoid(); continue; }
        Value *result = nullptr;
        if (external) {
            auto function = host("emu_" + name, FunctionType::get(i32, {ptr, i32, i32, i32}, false),
                                 reinterpret_cast<void *>(op.emulate));
            result = ir.CreateCall(function, {memory, a, b, c});
        } else if (name == "MOV") result = a;
        else if (name == "ADD") result = ir.CreateAdd(a, b);
        else if (name == "SUB") result = ir.CreateSub(a, b);
        else if (name == "MUL") result = ir.CreateMul(a, b);
        else if (name == "DIV" || name == "REM") result = division(a, b, name == "REM");
        else if (name == "MULDIV") result = division(ir.CreateMul(a, b), c, false);
        else if (name == "PACK") {
            auto *red = ir.CreateShl(ir.CreateAnd(a, constant(255)), constant(16));
            auto *green = ir.CreateShl(ir.CreateAnd(b, constant(255)), constant(8));
            auto *blue = ir.CreateAnd(c, constant(255));
            result = ir.CreateOr(constant(0xff000000u), ir.CreateOr(red, ir.CreateOr(green, blue)));
        } else if (name == "LD" || name == "ST") {
            auto *index = ir.CreateAdd(a, b);
            guard(ir.CreateICmpUGE(index, constant(MemoryWords)), 1);
            auto *address = ir.CreateGEP(i32, memory, index);
            if (name == "LD") result = ir.CreateLoad(i32, address);
            else ir.CreateStore(c, address);
        } else if (name == "RAND") result = ir.CreateCall(randFunction);
        else if (name == "FLUSH") result = ir.CreateCall(flushFunction);
        else if (name == "CELL") {
            auto *x = ir.CreateAdd(ir.CreateMul(a, constant(4)), constant(1));
            auto *y = ir.CreateAdd(ir.CreateMul(b, constant(4)), constant(1));
            auto *x1 = ir.CreateAdd(x, constant(1)), *y1 = ir.CreateAdd(y, constant(1));
            ir.CreateCall(pixelFunction, {x, y, c}); ir.CreateCall(pixelFunction, {x1, y, c});
            ir.CreateCall(pixelFunction, {x, y1, c}); ir.CreateCall(pixelFunction, {x1, y1, c});
        } else throw std::runtime_error("missing IR lowering: " + name);
        if (op.destination) ir.CreateStore(result, regPointer(inst.destination));
        ir.CreateBr(blocks[pc + 1]);
    }
    ir.SetInsertPoint(blocks.back());
    ir.CreateRetVoid();
    if (verifyModule(*module, &errs())) throw std::runtime_error("invalid generated IR");
    std::string error;
    EngineBuilder builder(std::move(module));
    builder.setEngineKind(EngineKind::JIT).setErrorStr(&error);
    std::unique_ptr<ExecutionEngine> engine(builder.create());
    if (!engine) throw std::runtime_error("ExecutionEngine: " + error);
    if (!dump.empty()) {
        std::error_code ec;
        raw_fd_ostream output(dump, ec, sys::fs::OF_Text);
        if (ec) throw std::runtime_error("cannot write IR: " + ec.message());
        entry->getParent()->print(output, nullptr);
        output.flush();
        if (output.has_error()) throw std::runtime_error("failed to write IR");
    }
    for (const auto &mapping : mappings) engine->addGlobalMapping(mapping.first, mapping.second);
    engine->finalizeObject();
    auto address = engine->getFunctionAddress("wave_main");
    if (!address) throw std::runtime_error("JIT entry not found");
    reinterpret_cast<void (*)(uint32_t *, uint32_t *)>(static_cast<uintptr_t>(address))(
        machine.regs.data(), machine.memory.data());
}
