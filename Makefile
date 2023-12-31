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

.PHONY: cs
cs: src/Mandelbrot.cs ## Run implementation in C# (Mono)
	mcs -out:mandelbrot_cs.out $<
	time mono mandelbrot_cs.out

.PHONY: cxx
cxx: src/mandelbrot.cxx ## Run implementation in C++
	g++ -o mandelbrot_cxx.out $<
	time ./mandelbrot_cxx.out

.PHONY: go
go: src/mandelbrot.go ## Run implementation in Go
	go build -o mandelbrot_go.out $<
	time ./mandelbrot_go.out

.PHONY: io
io: src/mandelbrot.io ## Run implementation in Io
	time io $<

.PHONY: lua
lua: src/mandelbrot.lua ## Run implementation in Lua
	time lua $<

.PHONY: pascal
pascal: src/mandelbrot.pas ## Run implementation in Pascal (FreePascal)
	fpc -FE`pwd` $<
	mv mandelbrot mandelbrot_pascal.out
	time ./mandelbrot_pascal.out

.PHONY: php
php: src/mandelbrot.php ## Run implementation in PHP
	time php $<

.PHONY: perl
perl: src/mandelbrot.pl ## Run implementation in Perl
	time perl $<

.PHONY: python
python: src/mandelbrot.py ## Run implementation in Python
	time python $<

.PHONY: ruby
ruby: src/mandelbrot.rb ## Run implementation in Ruby
	time ruby $<

.PHONY: rust
rust: src/mandelbrot.rs ## Run implementation in Rust
	rustc $< -o mandelbrot_rust.out
	time ./mandelbrot_rust.out
