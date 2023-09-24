include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message(FATAL_ERROR "UTILS_IS_FOUND: ${UTILS_IS_FOUND}")
endif()


include(${CMAKE_CURRENT_SOURCE_DIR}/common/cpp.cmake OPTIONAL RESULT_VARIABLE CPP_IS_FOUND)
if (CPP_IS_FOUND STREQUAL "NOTFOUND")
	message(FATAL_ERROR "CPP_IS_FOUND: ${CPP_IS_FOUND}")
endif()

setup_cpp("8.1.0")

execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
	"${DOWNLOADS_DIR}\\VSCode-win32-x64-1.66.1\\Code.exe" 
	--extensions-dir "$ENV{VSCODE_EXTENSION_PATH}" 
	--user-data-dir "$ENV{VSCODE_USER_DATA_PATH}"
	"."
	WORKING_DIRECTORY ${DOWNLOADS_DIR})