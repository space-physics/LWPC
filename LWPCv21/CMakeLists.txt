add_subdirectory(data)
add_subdirectory(lib)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(lwpc lwpm.for)
target_link_libraries(lwpc liblwpc)
add_test(NAME basic
COMMAND $<TARGET_FILE:lwpc>
WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/LWPCv21)

add_executable(scan scan.for)
target_link_libraries(scan liblwpc)

if(WIN32)
  add_executable(grdplot grdPlot.for)
  target_link_libraries(grdplot liblwpc plt)

  add_executable(lwfplot lwfPlot.for)
  target_link_libraries(lwfplot plt)

  add_executable(prvwplot prvwPlot.for)
  target_compile_options(prvwplot PRIVATE -fdollar-ok)
  target_link_libraries(prvwplot liblwpc plt)
endif(WIN32)
