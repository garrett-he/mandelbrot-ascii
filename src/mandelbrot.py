import os
import sys
from functools import partial
from typing import Callable


def mandelbrot_iterate(max_modulus: int, max_iterations: int, cr: float, ci: float) -> int:
    zr = zi = 0.0
    i = 0

    while True:
        rr = zr * zr
        ri = zi * zi
        rc = zr * zi

        zr = rr - ri + cr
        zi = 2 * rc + ci

        i += 1

        if rr + ri >= max_modulus:
            return i

        if i > max_iterations:
            return 0


def mandelbrot_draw(resolution: int, iterator: Callable[[float, float], int]):
    unit = int(resolution / 6)
    width = unit * 3 * 2
    height = unit * 2

    for j in range(height + 1):
        for i in range(width + 1):

            cr = (float(i) / float(unit) / 2.0) - 2.0
            ci = 1.0 - (float(j) / float(unit))

            result = (iterator(cr, ci)) % 26

            if result == 0:
                sys.stdout.write(' ')
            else:
                sys.stdout.write(chr(64 + result))

        sys.stdout.write('\n')


def main():
    max_modulus = int(os.getenv('MANDELBROT_MAX_MODULUS'))
    max_iterations = int(os.getenv('MANDELBROT_MAX_ITERATIONS'))
    resolution = int(os.getenv('MANDELBROT_RESOLUTION'))

    mandelbrot_draw(resolution, partial(mandelbrot_iterate, max_modulus, max_iterations))

    print(f'Max modulus: {max_modulus}')
    print(f'Max iterations: {max_iterations}')
    print(f'Resolution: {resolution}')


if __name__ == '__main__':
    main()
