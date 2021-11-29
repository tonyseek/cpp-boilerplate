add_library(demo lib.cpp)
target_include_directories(
  demo PUBLIC
  ${Boost_INCLUDE_DIRS})
target_link_libraries(
  demo PRIVATE
  ${Boost_LIBRARIES})
