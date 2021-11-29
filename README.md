# C++ Boilerplate

```sh
make clean
make build
make test
make test-coverage

gcovr --html --html-details -o ./build/coverage.html ./build
open ./build/coverage.html

# macOS
make CC=$(brew --prefix llvm)/bin/clang CXX=$(brew --prefix llvm)/bin/clang++
```
