SHELL := /bin/bash

export MANDELBROT_MAX_MODULUS=16
export MANDELBROT_MAX_ITERATIONS=100
export MANDELBROT_RESOLUTION=160

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show help information
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: basic
basic: src/mandelbrot.bas ## Run implementation in BASIC (FreeBASIC)
	fbc -o 'mandelbrot_basic' -x mandelbrot_basic.out $<
	time ./mandelbrot_basic.out

.PHONY: java
java: src/Mandelbrot.java ## Run implementation in Java
	javac -d `pwd` $<
	time java Mandelbrot

.PHONY: js
js: src/mandelbrot.js ## Run implementation in JavaScript (Node.js)
	time node $<

.PHONY: c
c: src/mandelbrot.c ## Run implementation in C
	cc -o mandelbrot_c.out $<
	time ./mandelbrot_c.out
.PHONY: cxx
cxx: src/mandelbrot.cxx ## Run implementation in C++
	g++ -o mandelbrot_cxx.out $<
	time ./mandelbrot_cxx.out

.PHONY: pascal
pascal: src/mandelbrot.pas ## Run implementation in Pascal (FreePascal)
	fpc -FE`pwd` $<
	mv mandelbrot mandelbrot_pascal.out
	time ./mandelbrot_pascal.out
