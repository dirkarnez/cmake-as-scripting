include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

set(ENV{GOROOT} "${DOWNLOADS_DIR}\\go1.21.0.windows-amd64\\go")
if(NOT EXISTS $ENV{GOROOT})
	download_file_and_uncompress("https://go.dev/dl/go1.21.0.windows-amd64.zip")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{GOROOT}\\bin")

execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
	"${DOWNLOADS_DIR}\\VSCode-win32-x64-1.66.1\\Code.exe" 
	--extensions-dir "$ENV{VSCODE_EXTENSION_PATH}" 
	--user-data-dir "$ENV{VSCODE_USER_DATA_PATH}"
	"."
	WORKING_DIRECTORY ${DOWNLOADS_DIR})