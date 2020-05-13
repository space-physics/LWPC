cmake_minimum_required (VERSION 3.13)
project(LWPC
LANGUAGES Fortran)
enable_testing()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

string(APPEND CMAKE_Fortran_FLAGS " -std=legacy -Werror=line-truncation")

set(BUILD_SHARED_LIBS true)

option(graphics "graphics may not work on modern computers" OFF)

if(graphics)
  enable_language(C)
endif()

add_subdirectory(LWPCv21)
