#include "runtime.h"
#include "../sim.h"
#include <cstdio>
#include <cstdlib>
#include <stdexcept>
#ifdef WAVE_SDL
#include <SDL.h>
#endif
static uint32_t frameLimit, frames, randomState;
static uint64_t pixels, hash = 14695981039346656037ull;
static bool graphicsEnabled;
#ifdef WAVE_SDL
static SDL_Window *window;
static SDL_Renderer *renderer;
#endif
void setupRuntime(uint32_t limit, uint32_t seed, bool graphics) {
    frameLimit = limit; randomState = seed; graphicsEnabled = graphics;
    frames = 0; pixels = 0; hash = 14695981039346656037ull;
    if (!graphics && !limit) throw std::runtime_error("--frames 0 requires --sdl");
#ifdef WAVE_SDL
    if (graphics) {
        if (SDL_Init(SDL_INIT_VIDEO) || SDL_CreateWindowAndRenderer(SIM_X_SIZE, SIM_Y_SIZE, 0, &window, &renderer))
            throw std::runtime_error(SDL_GetError());
        SDL_SetWindowTitle(window, "Wave ASM / LLVM ExecutionEngine");
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);
    }
#else
    if (graphics) throw std::runtime_error("SDL2 support not built; install libsdl2-dev and reconfigure CMake");
#endif
}
extern "C" uint32_t waveRand() {
    randomState = randomState * 1664525u + 1013904223u;
    return randomState >> 1;
}
static void hashWord(uint32_t word) {
    for (unsigned shift = 0; shift < 32; shift += 8) {
        hash ^= (word >> shift) & 255;
        hash *= 1099511628211ull;
    }
}
extern "C" void wavePixel(uint32_t x, uint32_t y, uint32_t color) {
    if (x >= SIM_X_SIZE || y >= SIM_Y_SIZE) {
        std::fputs("pixel out of range\n", stderr); std::exit(1);
    }
    hashWord(x); hashWord(y); hashWord(color); ++pixels;
#ifdef WAVE_SDL
    if (graphicsEnabled) {
        SDL_SetRenderDrawColor(renderer, (color >> 16) & 255, (color >> 8) & 255, color & 255, color >> 24);
        SDL_RenderDrawPoint(renderer, x, y);
    }
#endif
}
extern "C" uint32_t waveFlush() {
    ++frames;
    bool quit = false;
#ifdef WAVE_SDL
    if (graphicsEnabled) {
        SDL_RenderPresent(renderer);
        SDL_Event event;
        while (SDL_PollEvent(&event)) if (event.type == SDL_QUIT) quit = true;
    }
#endif
    return !quit && (!frameLimit || frames < frameLimit);
}
void finishRuntime() {
    std::printf("frames=%u pixels=%llu hash=%016llx\n", frames,
                static_cast<unsigned long long>(pixels), static_cast<unsigned long long>(hash));
#ifdef WAVE_SDL
    if (graphicsEnabled) { SDL_DestroyRenderer(renderer); SDL_DestroyWindow(window); SDL_Quit(); }
#endif
}
