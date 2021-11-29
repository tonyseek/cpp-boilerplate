BUILD_DIR = build
BUILD_TYPE = RelWithDebInfo
COVERAGE_INFO = $(BUILD_DIR)/coverage.info

.PHONY: build build-prepare test test-coverage clean

build: build-prepare
	cmake --build "$(BUILD_DIR)"

build-prepare:
	cmake -S . -B "$(BUILD_DIR)" -D "CMAKE_BUILD_TYPE=$(BUILD_TYPE)"

test: build
	ctest --test-dir "$(BUILD_DIR)" --output-on-failure

test-coverage: test
	lcov --directory "$(BUILD_DIR)" --capture --output-file "$(COVERAGE_INFO)"
	lcov --extract "$(COVERAGE_INFO)" "$(PWD)/*" --output-file "$(COVERAGE_INFO)"
	lcov --list "$(COVERAGE_INFO)"

clean:
	rm -rf "$(BUILD_DIR)"
