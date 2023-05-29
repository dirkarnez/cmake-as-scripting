include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Directory")
input(DIRECTORY)
message(${DIRECTORY})

execute_process(
    COMMAND cmd
    WORKING_DIRECTORY ${DIRECTORY})
