cmake_minimum_required(VERSION 3.5..3.22)
project(Demo)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/conan.cmake)
include(cmake/doctest.cmake)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

conan_cmake_autodetect(CONAN_SETTINGS)
conan_cmake_install(
  PATH_OR_REFERENCE ${CMAKE_CURRENT_SOURCE_DIR}
  BUILD outdated
  REMOTE conancenter
  SETTINGS ${CONAN_SETTINGS})

enable_testing()
find_package(Boost REQUIRED)
find_package(doctest REQUIRED)

include_directories(include)
add_subdirectory(src)
add_subdirectory(tests)
