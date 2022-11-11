program mandelbrot;

uses SysUtils;

function MandelbrotIterate(MaxModulus, MaxIterations: Cardinal; cr, ci: Real): Cardinal;
var
    i: Cardinal;
    zr, zi, rr, ri, rc: Real;
begin
    zr := 0.0;
    zi := 0.0;
    i := 0;

    while True do
    begin
        rr := zr * zr;
        ri := zi * zi;
        rc := zr * zi;

        zr := rr - ri + cr;
        zi := 2 * rc + ci;

        Inc(i);

        if (rr + ri) > MaxModulus then
        begin
            MandelbrotIterate := i;
            Break;
        end;

        if i > MaxIterations then
        begin
            MandelbrotIterate := 0;
            Break;
        end;
    end;
end;

procedure MandelbrotDraw(MaxModulus, MaxIterations, Resolution: Cardinal);
var
    cr, ci: Real;
    unt, rst, width, height: Cardinal;
    i, j: Cardinal;
begin
    unt := resolution div 6;
    width := unt * 3 * 2;
    height := unt * 2;

    for j := 0 to height do
    begin
        for i := 0 to width do
        begin
            cr := (i / unt ) / 2.0 - 2.0;
            ci := 1.0 - j / unt;

            rst := MandelbrotIterate(MaxModulus, MaxIterations, cr, ci) mod 26;

            if rst = 0 then
                Write(' ')
            else
                Write(chr(64 + rst));
        end;

        WriteLn();
    end;

end;

procedure Main();
var
    MaxModulus, MaxIterations, Resolution: Cardinal;
begin
    MaxModulus := StrToInt(GetEnvironmentVariable('MANDELBROT_MAX_MODULUS'));
    MaxIterations := StrToInt(GetEnvironmentVariable('MANDELBROT_MAX_ITERATIONS'));
    Resolution := StrToInt(GetEnvironmentVariable('MANDELBROT_RESOLUTION'));

    MandelbrotDraw(MaxModulus, MaxIterations, Resolution);

    WriteLn(Format('Max modulus: %d', [MaxModulus]));
    WriteLn(Format('Max iterations: %d', [MaxIterations]));
    WriteLn(Format('Resolution: %d', [Resolution]));
end;

begin
    Main();
end.
