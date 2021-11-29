#include <string>
#include <boost/format.hpp>
#include "demo/lib.h"

namespace demo {
    std::string greet(const std::string &&name) {
        auto fmt = boost::format("hello, %s") % name;
        return std::move(fmt).str();
    }
}
