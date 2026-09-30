#include "sim.h"

#define CELL_SIZE 4
#define X_SIZE (SIM_X_SIZE / CELL_SIZE)
#define Y_SIZE (SIM_Y_SIZE / CELL_SIZE)

#define BLACK 0xFF000000
#define RED   0xFFFF0000

void drawCell(int x, int y, int color) {
    int px = x * CELL_SIZE + 1;
    int py = y * CELL_SIZE + 1;

    simPutPixel(px,     py,     color);
    simPutPixel(px + 1, py,     color);
    simPutPixel(px,     py + 1, color);
    simPutPixel(px + 1, py + 1, color);
}

void app(void) {
    int frame = 0;
    int x;
    int y;
    int markerX;

    while (1) {
        markerX = frame % X_SIZE;

        for (y = 0; y < Y_SIZE; y++) {
            for (x = 0; x < X_SIZE; x++) {
                if (x == markerX)
                    drawCell(x, y, RED);
                else
                    drawCell(x, y, BLACK);
            }
        }

        simFlush();
        frame++;
    }
}
