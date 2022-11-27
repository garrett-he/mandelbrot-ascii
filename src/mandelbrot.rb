class Mandelbrot
    def initialize max_modulus, max_iterations
        @max_modulus = max_modulus
        @max_iterations = max_iterations
    end

    def iterate cr, ci
        zr = zi = 0.0
        i = 0

        while true
            rr = zr * zr
            ri = zi * zi
            rc = zr * zi

            zr = rr - ri + cr
            zi = 2 * rc + ci

            i = i + 1

            return i if rr + ri >= @max_modulus
            return 0 if i > @max_iterations
        end
    end

    def draw resolution
        unit = resolution / 6
        width = unit * 3 * 2
        height = unit * 2

        for j in 0..height do
            for i in 0..width do

                cr = (i.to_f / unit.to_f / 2.0) - 2.0
                ci = 1.0 - (j.to_f / unit.to_f)

                result = (iterate cr, ci) % 26

                if result == 0
                    print ' '
                else
                    print (64 + result).chr
                end
            end

            print "\n"
        end
    end
end

def main
    max_modulus = ENV['MANDELBROT_MAX_MODULUS'].to_i
    max_iterations = ENV['MANDELBROT_MAX_ITERATIONS'].to_i
    resolution = ENV['MANDELBROT_RESOLUTION'].to_i

    mandel = Mandelbrot.new max_modulus, max_iterations
    mandel.draw resolution

    puts("Max modulus: #{max_modulus}")
    puts("Max iterations: #{max_iterations}")
    puts("Resolution: #{resolution}")
end

main
