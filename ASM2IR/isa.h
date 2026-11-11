#pragma once
#include <array>
#include <cstdint>
#include <string>
#include <vector>

constexpr uint32_t RegisterCount = 32;
constexpr uint32_t MemoryWords = 3 * 384 * 192;
using Emulator = uint32_t (*)(uint32_t *, uint32_t, uint32_t, uint32_t);
struct OpInfo {
    const char *name;
    bool destination;
    unsigned values;
    bool branch;
    Emulator emulate;
};
extern const std::vector<OpInfo> Operations;
struct Operand { bool reg = false; uint32_t value = 0; };
struct Instruction {
    unsigned op = 0, destination = 0, line = 0;
    std::array<Operand, 3> args{};
    std::string label;
    size_t target = 0;
};
using Program = std::vector<Instruction>;
struct Machine {
    std::array<uint32_t, RegisterCount> regs{};
    std::vector<uint32_t> memory = std::vector<uint32_t>(MemoryWords);
};
Program parse(const std::string &path);
void executeIR(const Program &, Machine &, bool external, const std::string &dump);
extern "C" [[noreturn]] void waveFault(uint32_t code);
