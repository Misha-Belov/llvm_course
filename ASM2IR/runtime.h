#pragma once
#include <cstdint>
void setupRuntime(uint32_t frames, uint32_t seed, bool graphics);
void finishRuntime();
extern "C" uint32_t waveRand();
extern "C" uint32_t waveFlush();
extern "C" void wavePixel(uint32_t x, uint32_t y, uint32_t color);
