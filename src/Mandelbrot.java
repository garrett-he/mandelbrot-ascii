import java.util.Map;

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

                System.out.print(result == 0 ? ' ' : (char)(64 + result));
            }

            System.out.println();
        }

    }

    public static void main(String args[])
    {
        int resolution, maxModulus, maxIterations;
        Map<String,String> env = System.getenv();

        maxModulus = Integer.parseInt(env.get("MANDELBROT_MAX_MODULUS"));
        maxIterations = Integer.parseInt(env.get("MANDELBROT_MAX_ITERATIONS"));
        resolution = Integer.parseInt(env.get("MANDELBROT_RESOLUTION"));

        Mandelbrot m = new Mandelbrot(maxModulus, maxIterations);
        m.draw(resolution);

        System.out.println(String.format("Max modulus: %d", maxModulus));
        System.out.println(String.format("Max iterations: %d", maxIterations));
        System.out.println(String.format("Resolution: %d", resolution));
    }
}
