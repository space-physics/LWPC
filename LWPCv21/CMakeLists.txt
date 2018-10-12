cmake_minimum_required (VERSION 3.7)
project(LWPC Fortran C)
enable_testing()

add_subdirectory(lib)

include_directories(include)

add_executable(lwpc lwpm.for)
target_link_libraries(lwpc liblwpc)
