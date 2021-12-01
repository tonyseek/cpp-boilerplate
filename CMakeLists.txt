cmake_minimum_required(VERSION 3.5..3.22)
project(Demo)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/conan.cmake)
include(cmake/doctest.cmake)

conan_cmake_autodetect(CONAN_SETTINGS)
conan_cmake_install(
  PATH_OR_REFERENCE ${CMAKE_CURRENT_SOURCE_DIR}
  BUILD outdated
  REMOTE conancenter
  SETTINGS ${CONAN_SETTINGS})

include(${CMAKE_CURRENT_BINARY_DIR}/conan_paths.cmake)

enable_testing()
find_package(Boost REQUIRED)
find_package(doctest REQUIRED)

add_library(coverage_config INTERFACE)
if(CMAKE_BUILD_TYPE MATCHES "Debug|RelWithDebInfo")
  if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(coverage_config INTERFACE "-O0" "-g" "--coverage")
    target_link_options(coverage_config INTERFACE --coverage)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
      target_link_libraries(coverage_config INTERFACE gcov)
    else()
      target_link_libraries(coverage_config INTERFACE --coverage)
    endif()
  else()
    message("Coverage is not supported with ${CMAKE_CXX_COMPILER_ID}")
  endif()
endif()

include_directories(include)
install(
  DIRECTORY include
  DESTINATION include
  FILES_MATCHING
  PATTERN "*.h")

add_subdirectory(src)
add_subdirectory(apps)
add_subdirectory(tests)
