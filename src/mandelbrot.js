function mandelbrot_iterate(maxModulus, maxIterations, cr, ci) {
    let zr, zi, rr, ri, rc, i;

    zr = zi = 0.0;
    i = 0;

    do {
        rr = zr * zr;
        ri = zi * zi;
        rc = zr * zi;

        zr = rr - ri + cr;
        zi = 2 * rc + ci;

        i++;

        if (rr + ri > maxModulus) return i;
        if (i > maxIterations) return 0;
    } while (true);
}

function mandelbrot_draw(maxModulus, maxIterations, resolution) {
    const unit = Math.floor(resolution / 6);
    const width = unit * 3 * 2;
    const height = unit * 2;
    let cr, ci, result;

    for (let j = 0; j <= height; j++) {
        for (let i = 0; i <= width; i++) {
            cr = (i / unit / 2) - 2.0;
            ci = 1.0 - j / unit;

            result = mandelbrot_iterate(maxModulus, maxIterations, cr, ci) % 26;

            if (result === 0) {
                process.stdout.write(' ');
            } else {
                process.stdout.write(String.fromCharCode(64 + result));
            }
        }

        process.stdout.write('\n');
    }
}

function main() {
    const maxModulus = parseInt(process.env['MANDELBROT_MAX_MODULUS']);
    const maxIterations = parseInt(process.env['MANDELBROT_MAX_ITERATIONS']);
    const resolution = parseInt(process.env['MANDELBROT_RESOLUTION']);

    mandelbrot_draw(maxModulus, maxIterations, resolution);

    console.log(`Max modulus: ${maxModulus}`);
    console.log(`Max iterations: ${maxIterations}`);
    console.log(`Resolution: ${resolution}`);
}

main();
