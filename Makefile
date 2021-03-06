SHELLCHECK := $(shell command -v shellcheck 2> /dev/null)

.PHONY: all
all: install test

build:
	$(info *** Building docker images ***)
	./build.sh

test:
	$(info *** Running shellcheck ***)
	shellcheck -s bash build.sh

install:
ifndef SHELLCHECK
	$(warning shellcheck not installed, installing it)
	sudo apt-get install -y shellcheck
else
	$(info *** shellcheck installed, skipping ***)
endif
