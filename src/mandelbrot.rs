use std::env;

fn mandelbrot_iterate(max_modulus: u32, max_iterations: u32, cr: f64, ci: f64) -> u32 {
    let mut zr = 0.0;
    let mut zi = 0.0;
    let mut rr;
    let mut ri;
    let mut rc;
    let mut i = 0;

    loop {
        rr = zr * zr;
        ri = zi * zi;
        rc = zr * zi;
        zr = rr - ri + cr;
        zi = 2.0 * rc + ci;
        i += 1;

        if (rr + ri) as u32 >= max_modulus {
            return i;
        }

        if i > max_iterations {
            return 0;
        }
    }
}

fn mandelbrot_draw(max_modulus: u32, max_iterations: u32, resolution: u32) {
    let unit = (resolution / 6) as u32;
    let width = unit * 3 * 2;
    let height = unit * 2;

    let mut cr: f64;
    let mut ci: f64;
    let mut result: u32;

    for j in 0..height + 1 {
        for i in 0..width + 1 {
            cr = i as f64 / unit as f64 / 2.0 - 2.0;
            ci = 1.0 - (j as f64 / unit as f64);

            result = mandelbrot_iterate(max_modulus, max_iterations, cr, ci) % 26;

            if result == 0 {
                print!(" ");
            } else {
                print!("{}", char::from_u32(64 + result).unwrap());
            }
        }

        print!("\n");
    }
}

fn main() {
    let max_modulus = match env::var_os("MANDELBROT_MAX_MODULUS") {
        Some(v) => v.into_string().unwrap(),
        None => panic!("$MANDELBROT_MAX_MODULUS not set.")
    };

    let max_iterations = match env::var_os("MANDELBROT_MAX_ITERATIONS") {
        Some(v) => v.into_string().unwrap(),
        None => panic!("$MANDELBROT_MAX_ITERATIONS not set.")
    };

    let resolution = match env::var_os("MANDELBROT_RESOLUTION") {
        Some(v) => v.into_string().unwrap(),
        None => panic!("$MANDELBROT_RESOLUTION not set.")
    };

    mandelbrot_draw(
        max_modulus.parse::<u32>().unwrap(),
        max_iterations.parse::<u32>().unwrap(),
        resolution.parse::<u32>().unwrap()
    );

    println!("Max modulus: {}", max_modulus);
    println!("Max iterations: {}", max_iterations);
    println!("Resolution: {}", resolution);
}
