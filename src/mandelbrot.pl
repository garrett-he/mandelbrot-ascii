use strict;
use POSIX;

sub mandelbrot_iterate {
    my ($max_modulus, $max_iterations, $cr, $ci) = @_;
    my ($zr, $zi) = (0.0, 0.0);
    my $i = 0;

    while (1) {
        my $rr = $zr * $zr;
        my $ri = $zi * $zi;
        my $rc = $zr * $zi;

        $zr = $rr - $ri + $cr;
        $zi = 2 * $rc + $ci;

        $i++;

        if ($rr + $ri > $max_modulus) { return $i; }
        if ($i > $max_iterations) { return 0; }
    }
}

sub mandelbrot_draw {
    my ($max_modulus, $max_iterations, $resolution) = @_;
    my $unit = floor($resolution / 6);
    my $width = $unit * 6;
    my $height = $unit * 2;

    for (my $j = 0; $j <= $height; $j++) {
        for (my $i = 0; $i <= $width; $i++) {
            my $cr = ($i /  $unit / 2) - 2.0;
            my $ci = 1.0 - ($j / $unit);

            my $result = mandelbrot_iterate($max_modulus, $max_iterations, $cr, $ci) % 26;

            if ($result == 0) {
                print ' ';
            } else {
                print chr(64 + $result);
            }
        }

        print "\n";
    }
}

sub main {
    my $max_modulus = $ENV{'MANDELBROT_MAX_MODULUS'};
    my $max_iterations = $ENV{'MANDELBROT_MAX_ITERATIONS'};
    my $resolution = $ENV{'MANDELBROT_RESOLUTION'};

    mandelbrot_draw($max_modulus, $max_iterations, $resolution);

    print "Max modulus: $max_modulus\n";
    print "Max iterations: $max_iterations\n";
    print "Resolution: $resolution\n";
}

main();
