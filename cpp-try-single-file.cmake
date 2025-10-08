include(${CMAKE_CURRENT_LIST_DIR}/common/cpp.cmake OPTIONAL RESULT_VARIABLE CPP_IS_FOUND)
if (CPP_IS_FOUND STREQUAL "NOTFOUND")
  message(FATAL_ERROR "CPP_IS_FOUND: ${CPP_IS_FOUND}")
endif()
	
setup_cpp()
	
include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOT_FOUND")
    message(FATAL_ERROR "???")
    # generate one
endif()

message(".cpp full path")
input(CPP_PATH)
get_filename_component(CPP_PATH_BASE_DIR "${CPP_PATH}" DIRECTORY)
get_filename_component(CPP_FILE_NAME_WITHOUT_EXTENSION ${CPP_PATH} NAME_WLE)
message("${CPP_PATH} in ${CPP_PATH_BASE_DIR}")

execute_process(
	COMMAND g++ -static "${CPP_PATH}" -o "${CPP_FILE_NAME_WITHOUT_EXTENSION}.exe"
	WORKING_DIRECTORY "${CPP_PATH_BASE_DIR}")
	
execute_process(
	COMMAND "${CPP_FILE_NAME_WITHOUT_EXTENSION}.exe"
	WORKING_DIRECTORY "${CPP_PATH_BASE_DIR}")
	
