include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOT_FOUND")
    message(FATAL_ERROR "???")
    # generate one
endif()


include(${CMAKE_CURRENT_LIST_DIR}/common/devtunnel.cmake OPTIONAL RESULT_VARIABLE DEVTUNNEL_IS_FOUND)
if (DEVTUNNEL_IS_FOUND STREQUAL "NOT_FOUND")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("port")
input(PORT)
message("${PORT}")

execute_process(
	COMMAND devtunnel.exe user login -g -d
	WORKING_DIRECTORY "$ENV{SOFTWARE_DIR}"
)

execute_process(
	COMMAND devtunnel.exe host -p ${PORT} --allow-anonymous --protocol auto
	WORKING_DIRECTORY "$ENV{SOFTWARE_DIR}"
)
	