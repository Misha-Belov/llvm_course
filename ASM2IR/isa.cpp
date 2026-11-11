#include "isa.h"
#include "runtime.h"
#include <cctype>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <limits>
#include <sstream>
#include <stdexcept>
#include <unordered_map>

extern "C" [[noreturn]] void waveFault(uint32_t code) {
    std::cerr << "VM error: " << (code == 1 ? "memory address out of range" : "invalid signed division") << '\n';
    std::exit(1);
}
static int64_t signedValue(uint32_t a) {
    return a < 0x80000000u ? int64_t(a) : int64_t(a) - 0x100000000LL;
}
static uint32_t divide(uint32_t a, uint32_t b, bool remainder = false) {
    if (!b || (a == 0x80000000u && b == 0xffffffffu)) waveFault(2);
    return remainder ? signedValue(a) % signedValue(b) : signedValue(a) / signedValue(b);
}
static uint32_t address(uint32_t a, uint32_t b) {
    uint32_t index = a + b;
    if (index >= MemoryWords) waveFault(1);
    return index;
}
#define EMU(name, expression) \
    static uint32_t emu_##name([[maybe_unused]] uint32_t *m, [[maybe_unused]] uint32_t a, \
                             [[maybe_unused]] uint32_t b, [[maybe_unused]] uint32_t c) { return (expression); }
EMU(MOV, a)
EMU(ADD, a + b)
EMU(SUB, a - b)
EMU(MUL, a * b)
EMU(DIV, divide(a, b))
EMU(REM, divide(a, b, true))
EMU(MULDIV, divide(a * b, c))
EMU(PACK, 0xff000000u | ((a & 255) << 16) | ((b & 255) << 8) | (c & 255))
EMU(LD, m[address(a, b)])
EMU(ST, m[address(a, b)] = c)
EMU(RAND, waveRand())
EMU(FLUSH, waveFlush())
static uint32_t emu_CELL(uint32_t *, uint32_t a, uint32_t b, uint32_t c) {
    uint32_t x = a * 4 + 1, y = b * 4 + 1;
    wavePixel(x, y, c); wavePixel(x + 1, y, c);
    wavePixel(x, y + 1, c); wavePixel(x + 1, y + 1, c);
    return 0;
}
#undef EMU
const std::vector<OpInfo> Operations = {
#define OP(n, d, v) {#n, d, v, false, emu_##n}
    OP(MOV, true, 1), OP(ADD, true, 2), OP(SUB, true, 2), OP(MUL, true, 2),
    OP(DIV, true, 2), OP(REM, true, 2), OP(MULDIV, true, 3), OP(PACK, true, 3),
    OP(LD, true, 2), OP(ST, false, 3), OP(RAND, true, 0),
    OP(FLUSH, true, 0), OP(CELL, false, 3),
#undef OP
    {"JMP", false, 0, true, nullptr}, {"BEQ", false, 2, true, nullptr},
    {"BNE", false, 2, true, nullptr}, {"BLT", false, 2, true, nullptr},
    {"BLE", false, 2, true, nullptr}, {"HALT", false, 0, false, nullptr}
};
static bool identifier(const std::string &s) {
    if (s.empty() || !(std::isalpha(static_cast<unsigned char>(s[0])) || s[0] == '_')) return false;
    for (unsigned char c : s) if (!std::isalnum(c) && c != '_') return false;
    return true;
}
static Operand operand(const std::string &s, bool destination) {
    if (s.size() > 1 && s[0] == 'r') {
        const auto digits = s.substr(1);
        if (digits.find_first_not_of("0123456789") != std::string::npos)
            throw std::runtime_error("invalid register: " + s);
        auto n = std::stoull(digits);
        if (n >= RegisterCount) throw std::runtime_error("register out of range: " + s);
        return {true, static_cast<uint32_t>(n)};
    }
    if (destination) throw std::runtime_error("destination must be a register");
    size_t used = 0;
    auto start = s.find_first_not_of("+-");
    bool hex = start != std::string::npos && s.compare(start, 2, "0x") == 0;
    auto n = std::stoll(s, &used, hex ? 16 : 10);
    if (used != s.size() || n < INT32_MIN || n > UINT32_MAX)
        throw std::runtime_error("invalid 32-bit immediate: " + s);
    return {false, static_cast<uint32_t>(n)};
}
Program parse(const std::string &path) {
    std::ifstream input(path);
    if (!input) throw std::runtime_error("cannot open " + path);
    Program program;
    std::unordered_map<std::string, size_t> labels;
    std::string line;
    unsigned lineNumber = 0;
    while (std::getline(input, line)) {
        ++lineNumber;
        try {
            line = line.substr(0, line.find_first_of("#;"));
            for (char &c : line) if (c == ',') c = ' ';
            std::istringstream stream(line);
            std::string word;
            if (!(stream >> word)) continue;
            if (word.back() == ':') {
                auto label = word.substr(0, word.size() - 1);
                if (!identifier(label) || !labels.emplace(label, program.size()).second)
                    throw std::runtime_error("invalid or duplicate label: " + label);
                if (!(stream >> word)) continue;
            }
            unsigned op = 0;
            while (op < Operations.size() && word != Operations[op].name) ++op;
            if (op == Operations.size()) throw std::runtime_error("unknown opcode: " + word);
            const auto &info = Operations[op];
            Instruction inst;
            inst.op = op; inst.line = lineNumber;
            auto next = [&]() {
                std::string token;
                if (!(stream >> token)) throw std::runtime_error("missing operand");
                return token;
            };
            if (info.destination) inst.destination = operand(next(), true).value;
            for (unsigned i = 0; i < info.values; ++i) inst.args[i] = operand(next(), false);
            if (info.branch) {
                inst.label = next();
                if (!identifier(inst.label)) throw std::runtime_error("invalid branch label");
            }
            if (stream >> word) throw std::runtime_error("unexpected operand: " + word);
            program.push_back(inst);
        } catch (const std::exception &e) {
            throw std::runtime_error(path + ":" + std::to_string(lineNumber) + ": " + e.what());
        }
    }
    if (program.empty()) throw std::runtime_error(path + ": empty program");
    for (auto &inst : program) if (Operations[inst.op].branch) {
        auto it = labels.find(inst.label);
        if (it == labels.end()) throw std::runtime_error(path + ":" + std::to_string(inst.line) + ": unknown label: " + inst.label);
        inst.target = it->second;
    }
    return program;
}
