#include <stdio.h>
#include <stdlib.h>

unsigned int iterate(unsigned int max_modulus, unsigned int max_iterations, double cr, double ci) {
    double zr, zi, rr, ri, rc;
    unsigned int i;

    zr = zi = 0.0;

    i = 0;

    do {
        rr = zr * zr;
        ri = zi * zi;
        rc = zr * zi;

        zr = rr - ri + cr;
        zi = 2 * rc + ci;

        i++;

        if (rr + ri > max_modulus) return i;
        if (i > max_iterations) return 0;
    } while (1);
}

void mandelbrot_draw(unsigned int max_modulus, unsigned int max_iterations, unsigned int resolution) {
    double cr, ci;
    unsigned int unit, result, width, height;
    unsigned int i, j;

    unit = resolution / 6;
    width = unit * 3 * 2;
    height = unit * 2;

    for (j = 0; j <= height; j++) {
        for (i = 0; i <= width; i++) {
            cr = ((double) i / (double) unit) / 2.0 - 2.0;
            ci = 1.0 - (double) j / (double) unit;

            result = iterate(max_modulus, max_iterations, cr, ci) % 26;

            putchar(result == 0 ? ' ' : 64 + result);
        }

        putchar('\n');
    }
}

int main() {
    unsigned int max_modulus;
    unsigned int max_iterations;
    unsigned int resolution;

    max_modulus = atoi(getenv("MANDELBROT_MAX_MODULUS"));
    max_iterations = atoi(getenv("MANDELBROT_MAX_ITERATIONS"));
    resolution = atoi(getenv("MANDELBROT_RESOLUTION"));

    mandelbrot_draw(max_modulus, max_iterations, resolution);

    printf("Max modulus: %d\n", max_modulus);
    printf("Max iterations: %d\n", max_iterations);
    printf("Resolution: %d\n", resolution);

    return 0;
}
