cmake_minimum_required (VERSION 3.7)
project(LWPC Fortran C)
enable_testing()

add_compile_options(-g)

add_subdirectory(data)
add_subdirectory(lib)

include_directories(include)

add_executable(lwpc lwpm.for)
target_link_libraries(lwpc liblwpc)

add_executable(scan scan.for)
target_link_libraries(scan liblwpc)



if(WIN32)
  add_executable(grdplot grdPlot.for)
  target_link_libraries(grdplot plt)
  
  add_executable(lwfplot lwfPlot.for)
  target_link_libraries(plot plt)
  
  add_executable(prvwplot prvwPlot.for)
  target_compile_options(prvwplot PRIVATE -fdollar-ok)
  target_link_libraries(grdplot plt)

endif(WIN32)
