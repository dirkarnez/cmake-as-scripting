include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Existing repository **URL**:")
input(URL)
message(${URL})

execute_process(
    COMMAND git 
    "clone" 
    "${URL}"
    WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)