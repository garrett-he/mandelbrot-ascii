# mandelbrot-ascii

A collection of multilingual programs that generate ASCII character images
for [Mandelbrot set][1].

## Quickstart

1. Change the resolution (number of horizontal characters), max modulus and
   iterations if necessary in `Makefile`.

    ```
    export MANDELBROT_MAX_MODULUS=16       # The max modulus to iterate
    export MANDELBROT_MAX_ITERATIONS=100   # Max iterations for each complex number
    export MANDELBROT_RESOLUTION=160       # Resolution for display
    ```

2. Type `make LANG` to see the results.

   Example:

   ```
   DDDDDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEEFFFFFGGHILOKM GFFFFEEEEEEEEDDDDDDDDDDD
   DDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEFFFFFFFGGGHIJMQPKIHGGFFFFEEEEEEEEDDDDDDDDD
   DDDDDDDDDDDDDDEEEEEEEEEEEEEEFFFFFFFGGGGHIMRIN  TJJHGGGFFFFFEEEEEEDDDDDDDD
   DDDDDDDDDDDEEEEEEEEEEEEEFFFFFFFGGGHHHHIIJKX     JKIHHGGGGGFFEEEEEEDDDDDDD
   DDDDDDDDEEEEEEEEEEEEFFFFFFFFFGGGHOPBMKLGNYRW   VQQMRLIIIJTHGFFEEEEEDDDDDD
   DDDDDEEEEEEEEEEEFFFFFFFFFFGGGGHHIKO   K              OLHICIGFFFEEEEEDDDDD
   DDDEEEEEEEEEEFFFFFGGGGGGGGGGHHIJLMQ                     TKHGGFFEEEEEEDDDD
   DEEEEEEEEEFFFFFGGKKIHHHHIHHHIIJLR                        LJIGFFFEEEEEDDDD
   EEEEEEEEFFFFFFGGHJTMMKK NKLJJKLI                          LNGGFFEEEEEEDDD
   EEEEEEFFFFFFGGHHIJKPG YB    NMOM                          MIGGFFEEEEEEDDD
   EEEFFFFFGGGGHHJJJLJ          XV                           LHGFFFEEEEEEDDD
   FFFGGGHHHHHIIJLETXF           O                          MIGGFFFEEEEEEDDD
                                                          PKIHGGFFFEEEEEEDDD
   FFFGGGHHHHHIIJLETXF           O                          MIGGFFFEEEEEEDDD
   EEEFFFFFGGGGHHJJJLJ          XV                           LHGFFFEEEEEEDDD
   EEEEEEFFFFFFGGHHIJKPG YB    NMOM                          MIGGFFEEEEEEDDD
   EEEEEEEEFFFFFFGGHJTMMKK NKLJJKLI                          LNGGFFEEEEEEDDD
   DEEEEEEEEEFFFFFGGKKIHHHHIHHHIIJLR                        LJIGFFFEEEEEDDDD
   DDDEEEEEEEEEEFFFFFGGGGGGGGGGHHIJLMQ                     TKHGGFFEEEEEEDDDD
   DDDDDEEEEEEEEEEEFFFFFFFFFFGGGGHHIKO   K              OLHICIGFFFEEEEEDDDDD
   DDDDDDDDEEEEEEEEEEEEFFFFFFFFFGGGHOPBMKLGNYRW   VQQMRLIIIJTHGFFEEEEEDDDDDD
   DDDDDDDDDDDEEEEEEEEEEEEEFFFFFFFGGGHHHHIIJKX     JKIHHGGGGGFFEEEEEEDDDDDDD
   DDDDDDDDDDDDDDEEEEEEEEEEEEEEFFFFFFFGGGGHIMRIN  TJJHGGGFFFFFEEEEEEDDDDDDDD
   DDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEFFFFFFFGGGHIJMQPKIHGGFFFFEEEEEEEEDDDDDDDDD
   DDDDDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEEFFFFFGGHILOKM GFFFFEEEEEEEEDDDDDDDDDDD
   Max modulus: 16
   Max iterations: 100
   Resolution: 76
   ```

## Support Languages

* BASIC: https://en.wikipedia.org/wiki/BASIC
* C: https://en.wikipedia.org/wiki/C_(programming_language)
* C#: https://en.wikipedia.org/wiki/C_Sharp_(programming_language)
* C++: https://en.wikipedia.org/wiki/C%2B%2B
* Go: https://go.dev
* Io: https://iolanguage.org
* Java: https://www.java.com
* JavaScript: https://en.wikipedia.org/wiki/JavaScript
* Lua: https://www.lua.org
* Pascal: https://en.wikipedia.org/wiki/Pascal_(programming_language)
* Perl: https://www.perl.org
* PHP: https://www.php.net
* Python: https://python.org
* Ruby: https://www.ruby-lang.org
* Rust: https://www.rust-lang.org

## License

Copyright (C) 2022 Garrett HE <garrett.he@hotmail.com>

The BSD 3-Clause License, see [LICENSE](./LICENSE).

[1]: https://en.wikipedia.org/wiki/Mandelbrot_set
