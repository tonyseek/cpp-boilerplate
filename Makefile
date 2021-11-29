BUILD_DIR = build
BUILD_TYPE = RelWithDebInfo

.PHONY: build build-prepare test clean

build: build-prepare
	cmake --build "$(BUILD_DIR)"

build-prepare:
	cmake -S . -B "$(BUILD_DIR)" -D "CMAKE_BUILD_TYPE=$(BUILD_TYPE)"

test: build
	ctest --test-dir "$(BUILD_DIR)" --output-on-failure

clean:
	rm -rf "$(BUILD_DIR)"
