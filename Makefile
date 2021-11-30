BUILD_DIR = build
BUILD_TYPE = RelWithDebInfo
COVERAGE_INFO = $(BUILD_DIR)/coverage.info

.PHONY: build build-prepare test lint clean

ifeq ($(OS),Windows_NT)
	detected_OS := Windows
else
	detected_OS := $(shell uname)
endif

ifeq ($(detected_OS), Darwin)
	CC = $(shell brew --prefix llvm)/bin/clang
	CXX = $(shell brew --prefix llvm)/bin/clang++
endif

build: build-prepare
	cmake --build "$(BUILD_DIR)"

build-prepare:
	cmake -S . -B "$(BUILD_DIR)" \
		-D "CMAKE_BUILD_TYPE=$(BUILD_TYPE)" \
		-D "CMAKE_C_COMPILER=$(CC)" \
		-D "CMAKE_CXX_COMPILER=$(CXX)"

test: build
	ctest --test-dir "$(BUILD_DIR)" --output-on-failure
	lcov --directory "$(BUILD_DIR)" --capture --output-file "$(COVERAGE_INFO)"
	lcov --extract "$(COVERAGE_INFO)" "$(PWD)/*" --output-file "$(COVERAGE_INFO)"
	lcov --list "$(COVERAGE_INFO)"

lint:
	cpplint --recursive --exclude "$(BUILD_DIR)/*" .

clean:
	rm -rf "$(BUILD_DIR)"
