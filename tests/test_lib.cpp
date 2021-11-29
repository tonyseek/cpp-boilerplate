#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <string>
#include <doctest/doctest.h>
#include "demo/lib.h"

TEST_CASE("demo::greet with constant strings") {
    CHECK(demo::greet(std::string("foo")) == "hello, foo");
    CHECK(demo::greet(std::string("bar")) == "hello, bar");
}
