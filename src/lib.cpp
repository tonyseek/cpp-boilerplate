#include <string>
#include "demo/lib.h"

namespace demo {
    std::string greet(const std::string &&name) {
        return std::move(std::string("hello, ") + name);
    }
}
