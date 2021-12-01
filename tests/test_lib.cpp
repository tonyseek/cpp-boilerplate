#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <doctest/doctest.h>
#include <string>
#include "demo/lib.h"

TEST_CASE("demo::greet with strings") {
    CHECK(demo::greet(std::string("foo")) == "hello, foo");
    CHECK(demo::greet(std::string("bar")) == "hello, bar");

    std::string baz("baz");
    CHECK(demo::greet(std::move(baz)) == "hello, baz");
}
