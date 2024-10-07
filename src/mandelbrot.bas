Function MandelbrotIterate(maxModulus As Integer, maxIterations As Integer, cr As Double, ci As Double) As Integer
    Dim zr As Double
    Dim zi As Double
    Dim rr As Double
    Dim ri As Double
    Dim rc As Double
    Dim i As Integer

    zr = 0.0
    zi = 0.0

    i = 0

    Do
        rr = zr * zr
        ri = zi * zi
        rc = zr * zi

        zr = rr - ri + cr
        zi = 2 * rc + ci

        i = i + 1

        If rr + ri > maxModulus Then
            MandelbrotIterate = i
            Exit Function
        End If

        If i > maxIterations Then
            MandelbrotIterate = 0
            Exit Function
        End If
    Loop While True

End Function

Sub MandelbrotDraw(maxModulus As Integer, maxIterations As Integer, resolution As Integer)
    Dim cr As Double
    Dim ci As Double
    Dim unit As Integer
    Dim result As Integer
    Dim w As Integer
    Dim h As Integer
    Dim i As Integer
    Dim j As Integer

    unit = resolution / 6
    w = unit * 3 * 2
    h = unit * 2

    For j = 0 To h - 1
        For i = 0 To w - 1
            cr = i / unit / 2.0 - 2.0
            ci = 1.0 - j / unit

            result = MandelbrotIterate(maxModulus, maxIterations, cr, ci) Mod 26

            If result = 0 Then
                Print " ";
            Else
                Print Chr(64 + result);
            End If
        Next

        Print ""
    Next
End Sub

Sub Main
    Dim maxModulus As Integer
    Dim maxIterations As Integer
    Dim resolution As Integer

    maxModulus = ValInt(Trim(Environ("MANDELBROT_MAX_MODULUS")))
    maxIterations = ValInt(Trim(Environ("MANDELBROT_MAX_ITERATIONS")))
    resolution = ValInt(Trim(Environ("MANDELBROT_RESOLUTION")))

    MandelbrotDraw(maxModulus, maxIterations, resolution)

    Print "Max modulus: " & Str(maxModulus)
    Print "Max iterations: " & Str(maxIterations)
    Print "Resolution: " & Str(resolution)
End Sub

Main
