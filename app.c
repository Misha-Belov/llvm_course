#include "sim.h"

#define CELL_SIZE 4
#define X_SIZE (SIM_X_SIZE / CELL_SIZE)
#define Y_SIZE (SIM_Y_SIZE / CELL_SIZE)

#define TEMP_MAX 1024
#define SOURCE_RADIUS 8
#define BLACK 0xFF000000

int temperatureToColor(int temperature) {
    int r = 0;
    int g = 0;
    int b = 0;
    int t = temperature;

    if (t < 0)
        t = 0;
    if (t > TEMP_MAX)
        t = TEMP_MAX;

    if (t < 256) {
        b = t;
    } else if (t < 512) {
        g = t - 256;
        b = 255;
    } else if (t < 768) {
        r = t - 512;
        g = 255;
        b = 255 - (t - 512);
    } else {
        r = 255;
        g = TEMP_MAX - t;
        if (g > 255)
            g = 255;
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

void drawField(int *field) {
    int x;
    int y;

    for (y = 0; y < Y_SIZE; y++) {
        for (x = 0; x < X_SIZE; x++)
            drawCell(x, y, temperatureToColor(field[y * X_SIZE + x]));
    }
}

void setSource(int *field, int sourceX, int sourceY) {
    int dx;
    int dy;
    int x;
    int y;
    int distance2;
    int temperature;

    for (dy = -SOURCE_RADIUS; dy <= SOURCE_RADIUS; dy++) {
        for (dx = -SOURCE_RADIUS; dx <= SOURCE_RADIUS; dx++) {
            distance2 = dx * dx + dy * dy;

            if (distance2 <= SOURCE_RADIUS * SOURCE_RADIUS) {
                x = sourceX + dx;
                y = sourceY + dy;

                if (x >= 0 && x < X_SIZE && y >= 0 && y < Y_SIZE) {
                    temperature = TEMP_MAX -
                        distance2 * TEMP_MAX /
                        (SOURCE_RADIUS * SOURCE_RADIUS + 1);
                    field[y * X_SIZE + x] = temperature;
                }
            }
        }
    }
}

void clearField(int *field) {
    int i;

    for (i = 0; i < X_SIZE * Y_SIZE; i++)
        field[i] = 0;
}

void app(void) {
    int field[X_SIZE * Y_SIZE] = {0};
    int frame = 0;
    int sourceX;
    int sourceY = Y_SIZE / 2;

    while (1) {
        clearField(field);
        sourceX = 16 + (frame % (X_SIZE - 32));
        setSource(field, sourceX, sourceY);
        drawField(field);
        simFlush();
        frame++;
    }
}
