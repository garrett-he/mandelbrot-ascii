<?php
function mandelbrot_iterate($max_modulus, $max_iterations, $cr, $ci)
{
    $zr = $zi = 0.0;
    $i = 0;

    do {
        $rr = $zr * $zr;
        $ri = $zi * $zi;
        $rc = $zr * $zi;

        $zr = $rr - $ri + $cr;
        $zi = 2 * $rc + $ci;

        $i++;

        if ($rr + $ri > $max_modulus)
            return $i;
        if ($i > $max_iterations)
            return 0;
    } while (true);
}

function mandelbrot_draw($max_modulus, $max_iterations, $resolution)
{
    $unit = floor($resolution / 6);
    $width = $unit * 3 * 2;
    $height = $unit * 2;

    for ($j = 0; $j <= $height; $j++) {
        for ($i = 0; $i <= $width; $i++) {
            $cr = ($i / $unit / 2) - 2.0;
            $ci = 1.0 - ($j / $unit);

            $result = mandelbrot_iterate($max_modulus, $max_iterations, $cr, $ci) % 26;

            if ($result == 0) {
                fputs(STDOUT, ' ');
            } else {
                fputs(STDOUT, chr(64 + $result));
            }
        }

        fputs(STDOUT, "\n");
    }
}

function main()
{
    $max_modulus = intval(getenv('MANDELBROT_MAX_MODULUS'));
    $max_iterations = intval(getenv('MANDELBROT_MAX_ITERATIONS'));
    $resolution = intval(getenv('MANDELBROT_RESOLUTION'));

    mandelbrot_draw($max_modulus, $max_iterations, $resolution);

    echo "Max modulus: {$max_modulus}\n";
    echo "Max iterations: {$max_iterations}\n";
    echo "Resolution: {$resolution}\n";
}

main();
