include(${CMAKE_CURRENT_LIST_DIR}/common/go.cmake OPTIONAL RESULT_VARIABLE GO_IS_FOUND)
if (GO_IS_FOUND STREQUAL "NOTFOUND")
  message(FATAL_ERROR "GO_IS_FOUND: ${GO_IS_FOUND}")
endif()
	
setup_go("1.25.0")
	
include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOT_FOUND")
    message(FATAL_ERROR "???")
    # generate one
endif()

message(".go full path")
input(GO_PATH)
get_filename_component(GO_PATH_BASE_DIR "${GO_PATH}" DIRECTORY)
message("${GO_PATH} in ${GO_PATH_BASE_DIR}")

execute_process(
	COMMAND go run "${GO_PATH}"
	WORKING_DIRECTORY "${GO_PATH_BASE_DIR}")
	
# message("${CPP_PATH} is compiled ${CPP_FILE_NAME_WITHOUT_EXTENSION}.exe")

# execute_process(
#  	COMMAND "${CPP_FILE_NAME_WITHOUT_EXTENSION}.exe"
# 	WORKING_DIRECTORY "${CPP_PATH_BASE_DIR}")

pause()
