#include "sim.h"

#define CELL_SIZE 4
#define X_SIZE (SIM_X_SIZE / CELL_SIZE)
#define Y_SIZE (SIM_Y_SIZE / CELL_SIZE)

#define WAVE_MAX 1000
#define SOURCE_RADIUS 6
#define SOURCE_AMPLITUDE 1800

#define DAMPING_NUM 998
#define DAMPING_DEN 1000

#define BLACK 0xFF000000

int waveToColor(int value) {
    int r;
    int g;
    int b;
    int a = value;

    if (a > WAVE_MAX)
        a = WAVE_MAX;
    if (a < -WAVE_MAX)
        a = -WAVE_MAX;

    if (a >= 0) {
        r = 10 + a * 245 / WAVE_MAX;
        g = 20 + a * 235 / WAVE_MAX;
        b = 40 + a * 215 / WAVE_MAX;
    } else {
        a = -a;

        r = 5;
        g = 10 + a * 30 / WAVE_MAX;
        b = 25 + a * 100 / WAVE_MAX;
    }

    return 0xFF000000 | (r << 16) | (g << 8) | b;
}

void drawCell(int x, int y, int color) {
    int px = x * CELL_SIZE + 1;
    int py = y * CELL_SIZE + 1;

    simPutPixel(px,     py,     color);
    simPutPixel(px + 1, py,     color);
    simPutPixel(px,     py + 1, color);
    simPutPixel(px + 1, py + 1, color);
}

void drawField(int *field) {
    int x;
    int y;

    for (y = 0; y < Y_SIZE; y++) {
        for (x = 0; x < X_SIZE; x++)
            drawCell(x, y, waveToColor(field[y * X_SIZE + x]));
    }
}

void clearField(int *field) {
    int i;

    for (i = 0; i < X_SIZE * Y_SIZE; i++)
        field[i] = 0;
}

void addSource(int *field, int sourceX, int sourceY) {
    int dx;
    int dy;
    int x;
    int y;
    int distance2;
    int radius2 = SOURCE_RADIUS * SOURCE_RADIUS;
    int value;

    for (dy = -SOURCE_RADIUS; dy <= SOURCE_RADIUS; dy++) {
        for (dx = -SOURCE_RADIUS; dx <= SOURCE_RADIUS; dx++) {
            distance2 = dx * dx + dy * dy;

            if (distance2 <= radius2) {
                x = sourceX + dx;
                y = sourceY + dy;

                if (x > 0 && x < X_SIZE - 1 &&
                    y > 0 && y < Y_SIZE - 1) {
                    value = SOURCE_AMPLITUDE *
                            (radius2 - distance2) /
                            (radius2 + 1);

                    field[y * X_SIZE + x] += value;
                }
            }
        }
    }
}

int randomX(void) {
    int margin = SOURCE_RADIUS + 2;

    return margin +
           simRand() % (X_SIZE - 2 * margin);
}

int randomY(void) {
    int margin = SOURCE_RADIUS + 2;

    return margin +
           simRand() % (Y_SIZE - 2 * margin);
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

#define SOURCE_PERIOD 70

void app(void) {
    int field0[X_SIZE * Y_SIZE];
    int field1[X_SIZE * Y_SIZE];
    int field2[X_SIZE * Y_SIZE];

    int *previous = field0;
    int *current = field1;
    int *next = field2;
    int *tmp;

    int frame = 0;
    int sourceX;
    int sourceY;

    clearField(previous);
    clearField(current);
    clearField(next);

    while (1) {
        if (frame % SOURCE_PERIOD == 0) {
            sourceX = randomX();
            sourceY = randomY();

            addSource(previous, sourceX, sourceY);
            addSource(current, sourceX, sourceY);
        }

        drawField(current);
        simFlush();

        stepWave(previous, current, next);

        tmp = previous;
        previous = current;
        current = next;
        next = tmp;

        frame++;
    }
}
