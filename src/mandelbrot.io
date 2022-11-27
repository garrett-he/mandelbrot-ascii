iterate := method(max_modulus, max_iterations, cr, ci,
    zi := 0.0
    zr := 0.0
    i := 0

    while (true,
        rr := zr * zr
        ri := zi * zi
        rc := zr * zi

        zr := rr - ri + cr
        zi := 2 * rc + ci

        i := i + 1

        if (rr + ri >= max_modulus,
            return i)

        if (i > max_iterations,
            return 0)
    )
)

draw := method(max_modulus, max_iterations, resolution,
    unit := (resolution / 6) floor
    width := unit * 6
    height := unit * 2

    for (j, 0, height,
        for (i, 0, width,
            cr := (i / unit / 2.0) - 2.0
            ci := 1.0 - (j / unit)

            result := iterate(max_modulus, max_iterations, cr, ci) % 26

            if (result == 0, write(" "), write((64 + result) asCharacter))
        )

        write("\n")
    )
)


max_modulus := System getEnvironmentVariable("MANDELBROT_MAX_MODULUS") asNumber
max_iterations := System getEnvironmentVariable("MANDELBROT_MAX_ITERATIONS") asNumber
resolution := System getEnvironmentVariable("MANDELBROT_RESOLUTION") asNumber

draw(max_modulus, max_iterations, resolution)

write("Max modulus: ", max_modulus, "\n")
write("Max iterations: ", max_iterations, "\n")
write("Resolution: ", resolution, "\n")
