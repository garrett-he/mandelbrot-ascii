function mandelbrot_iterate(max_modulus, max_iterations, cr, ci)
    local zr, zi = 0, 0
    local rr, ri, rc
    local i = 0

    repeat
        rr = zr * zr
        ri = zi * zi
        rc = zr * zi

        zr = rr - ri + cr
        zi = 2 * rc + ci

        i = i + 1

        if rr + ri > max_modulus then
            return i
        end
        if i > max_iterations then
            return 0
        end
    until false
end

function mandelbrot_draw(max_modulus, max_iterations, resolution)
    local cr, ci

    unit = math.floor(resolution / 6)
    width = unit * 3 * 2
    height = unit * 2

    for j = 0, height do
        for i = 0, width do
            cr = i / unit / 2 - 2.0
            ci = 1 - j / unit

            result = mandelbrot_iterate(max_modulus, max_iterations, cr, ci) % 26

            if result == 0 then
                io.stdout:write(' ')
            else
                io.stdout:write(string.char(64 + result))
            end
        end

        io.stdout:write('\n')
    end
end

function main()
    max_modulus = tonumber(os.getenv('MANDELBROT_MAX_MODULUS'))
    max_iterations = tonumber(os.getenv('MANDELBROT_MAX_ITERATIONS'))
    resolution = tonumber(os.getenv('MANDELBROT_RESOLUTION'))

    mandelbrot_draw(max_modulus, max_iterations, resolution)

    print('Max modulus: ' .. max_modulus)
    print('Max iterations: ' .. max_iterations)
    print('Resolution: ' .. resolution)
end

main()
