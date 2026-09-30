#include "sim.h"

#define CELL_SIZE 4
#define X_SIZE (SIM_X_SIZE / CELL_SIZE)
#define Y_SIZE (SIM_Y_SIZE / CELL_SIZE)

#define WAVE_MAX 2048
#define DROP_RADIUS 6
#define DROP_AMPLITUDE 1800

#define DAMPING_NUM 998
#define DAMPING_DEN 1000

#define BLACK 0xFF000000

int waveToColor(int value) {
    int r = 8;
    int g = 35;
    int b = 75;
    int a = value;

    if (a > WAVE_MAX)
        a = WAVE_MAX;
    if (a < -WAVE_MAX)
        a = -WAVE_MAX;

    if (a >= 0) {
        r += a * 70 / WAVE_MAX;
        g += a * 180 / WAVE_MAX;
        b += a * 180 / WAVE_MAX;
    } else {
        a = -a;
        r -= a * 6 / WAVE_MAX;
        g -= a * 25 / WAVE_MAX;
        b -= a * 45 / WAVE_MAX;
    }

    return BLACK | (r << 16) | (g << 8) | b;
}

void drawCell(int x, int y, int color) {
    int px = x * CELL_SIZE + 1;
    int py = y * CELL_SIZE + 1;

    simPutPixel(px,     py,     color);
    simPutPixel(px + 1, py,     color);
    simPutPixel(px,     py + 1, color);
    simPutPixel(px + 1, py + 1, color);
}

void clearField(int *field) {
    int i;

    for (i = 0; i < X_SIZE * Y_SIZE; i++)
        field[i] = 0;
}

void addDrop(int *field, int sourceX, int sourceY, int amplitude) {
    int dx;
    int dy;
    int x;
    int y;
    int distance2;
    int radius2 = DROP_RADIUS * DROP_RADIUS;
    int value;

    for (dy = -DROP_RADIUS; dy <= DROP_RADIUS; dy++) {
        for (dx = -DROP_RADIUS; dx <= DROP_RADIUS; dx++) {
            distance2 = dx * dx + dy * dy;

            if (distance2 <= radius2) {
                x = sourceX + dx;
                y = sourceY + dy;

                if (x > 0 && x < X_SIZE - 1 &&
                    y > 0 && y < Y_SIZE - 1) {
                    value = amplitude * (radius2 - distance2) /
                            (radius2 + 1);
                    field[y * X_SIZE + x] += value;
                }
            }
        }
    }
}

void stepWave(int *previous, int *current, int *next) {
    int x;
    int y;
    int idx;
    int value;

    for (x = 0; x < X_SIZE; x++) {
        next[x] = 0;
        next[(Y_SIZE - 1) * X_SIZE + x] = 0;
    }

    for (y = 0; y < Y_SIZE; y++) {
        next[y * X_SIZE] = 0;
        next[y * X_SIZE + X_SIZE - 1] = 0;
    }

    for (y = 1; y < Y_SIZE - 1; y++) {
        for (x = 1; x < X_SIZE - 1; x++) {
            idx = y * X_SIZE + x;

            value =
                (current[idx - 1] +
                 current[idx + 1] +
                 current[idx - X_SIZE] +
                 current[idx + X_SIZE]) / 2
                - previous[idx];

            value = value * DAMPING_NUM / DAMPING_DEN;
            next[idx] = value;
        }
    }
}

void drawField(int *field) {
    int x;
    int y;

    for (y = 0; y < Y_SIZE; y++) {
        for (x = 0; x < X_SIZE; x++)
            drawCell(x, y, waveToColor(field[y * X_SIZE + x]));
    }
}

void app(void) {
    int field0[X_SIZE * Y_SIZE];
    int field1[X_SIZE * Y_SIZE];
    int field2[X_SIZE * Y_SIZE];

    int *previous = field0;
    int *current = field1;
    int *next = field2;
    int *tmp;

    clearField(previous);
    clearField(current);
    clearField(next);

    addDrop(previous, X_SIZE / 2, Y_SIZE / 2, DROP_AMPLITUDE);
    addDrop(current,  X_SIZE / 2, Y_SIZE / 2, DROP_AMPLITUDE);

    while (1) {
        drawField(current);
        simFlush();

        stepWave(previous, current, next);

        tmp = previous;
        previous = current;
        current = next;
        next = tmp;
    }
}
