add_executable(unf_cond unf_cond.for)
target_compile_options(unf_cond PRIVATE -fdollar-ok)

add_executable(unf_coas unf_coas.for)
target_compile_options(unf_coas PRIVATE -fdec-structure)

add_executable(unf_itsn unf_itsn.for)

add_executable(unf_ntia unf_ntia.for)

