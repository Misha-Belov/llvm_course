#include "isa.h"
#include "runtime.h"
#include <fstream>
#include <iostream>
#include <stdexcept>
static uint32_t number(const std::string &s) {
    if (s.empty() || s.find_first_not_of("0123456789") != std::string::npos)
        throw std::runtime_error("expected unsigned decimal number: " + s);
    auto n = std::stoull(s);
    if (n > UINT32_MAX) throw std::runtime_error("number out of range");
    return static_cast<uint32_t>(n);
}
int main(int argc, char **argv) {
    try {
        if (argc < 3) throw std::runtime_error("usage: asm2ir ext|full program.s [--frames N] [--seed N] [--dump file.ll] [--state file.bin] [--sdl]");
        std::string mode = argv[1], dump, state;
        if (mode != "ext" && mode != "full") throw std::runtime_error("unknown mode: " + mode);
        uint32_t frames = 2, seed = 1;
        bool graphics = false;
        for (int i = 3; i < argc; ++i) {
            std::string option = argv[i];
            if (option == "--sdl") { graphics = true; continue; }
            if (++i == argc) throw std::runtime_error("missing value for " + option);
            if (option == "--frames") frames = number(argv[i]);
            else if (option == "--seed") seed = number(argv[i]);
            else if (option == "--dump") dump = argv[i];
            else if (option == "--state") state = argv[i];
            else throw std::runtime_error("unknown option: " + option);
        }
        auto program = parse(argv[2]);
        Machine machine;
        setupRuntime(frames, seed, graphics);
        executeIR(program, machine, mode == "ext", dump);
        if (!state.empty()) {
            std::ofstream output(state, std::ios::binary);
            output.write(reinterpret_cast<const char *>(machine.regs.data()), sizeof(machine.regs));
            output.write(reinterpret_cast<const char *>(machine.memory.data()), machine.memory.size() * sizeof(uint32_t));
            if (!output) throw std::runtime_error("cannot write state: " + state);
        }
        finishRuntime();
    } catch (const std::exception &e) { std::cerr << e.what() << '\n'; return 1; }
}
