all: build test
.PHONY: all

build:
	$(info *** Building docker images ***)
	./build.sh

test:
	$(info *** Running shellcheck ***)
	shellcheck -s bash build.sh
