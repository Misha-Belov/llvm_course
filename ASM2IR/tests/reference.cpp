#include "runtime.h"
#include <csetjmp>
#include <iostream>
#include <stdexcept>
#include <string>
extern "C" void app();
static std::jmp_buf finished;
extern "C" int simRand() { return static_cast<int>(waveRand()); }
extern "C" void simPutPixel(int x, int y, int color) { wavePixel(x, y, color); }
extern "C" void simFlush() { if (!waveFlush()) std::longjmp(finished, 1); }
int main(int argc, char **argv) {
    try {
        if (argc != 3) throw std::runtime_error("usage: wave_reference frames seed");
        setupRuntime(std::stoul(argv[1]), std::stoul(argv[2]), false);
        if (!setjmp(finished)) app();
        finishRuntime();
    } catch (const std::exception &e) { std::cerr << e.what() << '\n'; return 1; }
}
