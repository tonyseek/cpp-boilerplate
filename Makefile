BUILD_DIR = build
BUILD_TYPE = RelWithDebInfo

.PHONY: build build-prepare clean

build: build-prepare
	cmake --build "$(BUILD_DIR)"

build-prepare:
	cmake -S . -B "$(BUILD_DIR)" -D "CMAKE_BUILD_TYPE=$(BUILD_TYPE)"

clean:
	rm -rf "$(BUILD_DIR)"
