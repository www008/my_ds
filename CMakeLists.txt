cmake_minimum_required(VERSION 3.20)

project(my_ds LANGUAGES CXX)
set(CMAKE_VERBOSE_MAKEFILEON ON)

# require C++11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

enable_testing()
add_subdirectory( src )
add_subdirectory( test )
