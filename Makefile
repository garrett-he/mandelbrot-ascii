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
