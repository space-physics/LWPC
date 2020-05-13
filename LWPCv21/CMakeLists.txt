add_subdirectory(data)
add_subdirectory(lib)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(lwpc.bin lwpm.for)
target_link_libraries(lwpc.bin lwpc)
add_test(NAME basic
COMMAND $<TARGET_FILE:lwpc.bin>
WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/LWPCv21)

add_executable(scan scan.for)
target_link_libraries(scan lwpc)

if(graphics)
add_executable(grdplot grdPlot.for)
target_link_libraries(grdplot lwpc plt pltsys)

add_executable(lwfplot lwfPlot.for)
target_link_libraries(lwfplot plt pltsys)

add_executable(prvwplot prvwPlot.for)
target_compile_options(prvwplot PRIVATE -fdollar-ok)
target_link_libraries(prvwplot lwpc plt pltsys)
endif(graphics)
