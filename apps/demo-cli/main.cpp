#include <iostream>
#include "demo/lib.h"

int main(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        std::cout << demo::greet(argv[i]) << std::endl;
    }
    return 0;
}
