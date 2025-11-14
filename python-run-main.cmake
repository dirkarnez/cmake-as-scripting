include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Directory")
input(DIRECTORY)
message("${DIRECTORY}")

execute_process(
    COMMAND python main.py
    WORKING_DIRECTORY ${DIRECTORY})