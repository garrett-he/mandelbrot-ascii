#include <iostream>
#include <cstdlib>

class Mandelbrot {
private:
    unsigned int max_modulus;
    unsigned int max_iterations;

    unsigned int iterate(double cr, double ci);

public:
    void draw(unsigned int resolution);

    Mandelbrot(unsigned int max_modulus, unsigned int max_iterations);
};

Mandelbrot::Mandelbrot(unsigned int max_modulus, unsigned int max_iterations) {
    this->max_modulus = max_modulus;
    this->max_iterations = max_iterations;
}

unsigned int Mandelbrot::iterate(double cr, double ci) {
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

        if (rr + ri > this->max_modulus) return i;
        if (i > this->max_iterations) return 0;
    } while (1);
}

void Mandelbrot::draw(unsigned int resolution) {
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

            result = iterate(cr, ci) % 26;

            putchar(result == 0 ? ' ' : 64 + result);
        }

        putchar('\n');
    }
}

int main() {
    unsigned int max_modulus;
    unsigned int max_iterations;
    unsigned int resolution;

    max_modulus = atoi(std::getenv("MANDELBROT_MAX_MODULUS"));
    max_iterations = atoi(std::getenv("MANDELBROT_MAX_ITERATIONS"));
    resolution = atoi(std::getenv("MANDELBROT_RESOLUTION"));

    Mandelbrot *mandelbrot = new Mandelbrot(max_modulus, max_iterations);
    mandelbrot->draw(resolution);
    delete mandelbrot;

    std::cout << "Max modulus: " << max_modulus << std::endl;
    std::cout << "Max iterations: " << max_iterations << std::endl;
    std::cout << "Resolution: " << resolution << std::endl;

    return 0;
}
