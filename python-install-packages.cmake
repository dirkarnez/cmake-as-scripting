include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Directory")
input(DIRECTORY)
message("${DIRECTORY}")

execute_process(
    COMMAND python -m pip install --upgrade pip
    WORKING_DIRECTORY ${DIRECTORY})

execute_process(
    COMMAND python -m pip install -r requirements.txt
    WORKING_DIRECTORY ${DIRECTORY})