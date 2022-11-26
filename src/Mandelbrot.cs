using System;

class Mandelbrot
{
    private int maxModulus;
    private int maxIterations;

    public Mandelbrot(int maxModulus, int maxIterations)
    {
        this.maxModulus = maxModulus;
        this.maxIterations = maxIterations;
    }

    public int iterate(double cr, double ci)
    {
        double zr, zi, rr, ri, rc;
        int i;

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

    public void draw(int resolution)
    {
        double cr, ci;
        int unit, result, width, height;
        int i, j;

        unit = resolution / 6;
        width = unit * 3 * 2;
        height = unit * 2;

        for (j = 0; j <= height; j++) {
            for (i = 0; i <= width; i++) {
                cr = (i * 1.0 / unit * 1.0) / 2.0 - 2.0;
                ci = 1.0 - j * 1.0 / unit * 1.0;

                result = iterate(cr, ci) % 26;

                Console.Write(result == 0 ? ' ' : (char)(64 + result));
            }

            Console.Write("\n");
        }
    }

    public static void Main(string[] args)
    {
        int maxModulus, maxIterations, resolution;

        maxModulus = int.Parse(System.Environment.GetEnvironmentVariable("MANDELBROT_MAX_MODULUS"));
        maxIterations = int.Parse(System.Environment.GetEnvironmentVariable("MANDELBROT_MAX_ITERATIONS"));
        resolution = int.Parse(System.Environment.GetEnvironmentVariable("MANDELBROT_RESOLUTION"));

        (new Mandelbrot(maxModulus, maxIterations)).draw(resolution);

        Console.WriteLine("Max modulus: {0}", maxModulus);
        Console.WriteLine("Max iterations: {0}", maxIterations);
        Console.WriteLine("Resolution: {0}", resolution);
    }
}
