add_executable(tests test_lib.cpp)
target_compile_features(tests PRIVATE cxx_std_17)
target_include_directories(tests PUBLIC ${doctest_INCLUDE_DIRS})
target_link_libraries(tests PRIVATE demo ${doctest_LIBRARIES})
doctest_discover_tests(tests ADD_LABELS ON)
