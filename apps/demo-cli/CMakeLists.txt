add_executable(demo-cli main.cpp)
set_target_properties(demo-cli PROPERTIES OUTPUT_NAME demo)
target_link_libraries(demo-cli PRIVATE demo)
install(TARGETS demo-cli)
