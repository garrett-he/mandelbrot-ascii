package main

import (
    "fmt"
    "os"
    "strconv"
)

func iterate(max_modulus int, max_iterations int, ci float64, cr float64) int {
    var zr, zi = 0.0, 0.0
    var i = 0
    var result int

    for true {
        rr := zr * zr
        ri := zi * zi
        rc := zr * zi

        zr = rr - ri + cr
        zi = 2*rc + ci

        i++

        if int(rr+ri) > max_modulus {
            result = i
            break
        }

        if i > max_iterations {
            result = 0
            break
        }
    }

    return result
}

func mandelbrot_draw(max_modulus int, max_iterations int, resolution int) {
    var cr, ci float64
    var unit = resolution / 6
    var width = unit * 3 * 2
    var height = unit * 2
    var result int
    var i, j int

    for j = 0; j <= height; j++ {
        for i = 0; i <= width; i++ {
            ci = ((float64(i) / float64(unit)) / 2.0) - 2.0
            cr = 1.0 - (float64(j) / float64(unit))

            result = iterate(max_modulus, max_iterations, cr, ci) % 26

            if result == 0 {
                fmt.Print(" ")
            } else {
                fmt.Print(string(64 + result))
            }
        }

        fmt.Print("\n")
    }
}

func main() {
    var max_modulus, _ = strconv.Atoi(os.Getenv("MANDELBROT_MAX_MODULUS"))
    var max_iterations, _ = strconv.Atoi(os.Getenv("MANDELBROT_MAX_ITERATIONS"))
    var resolution, _ = strconv.Atoi(os.Getenv("MANDELBROT_RESOLUTION"))

    mandelbrot_draw(max_modulus, max_iterations, resolution)

    fmt.Println("Max modulus: ", max_modulus)
    fmt.Println("Max iterations: ", max_iterations)
    fmt.Println("Resolution: ", resolution)
}
