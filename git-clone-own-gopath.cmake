include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/go.cmake)

if(NOT DEFINED GIT_TOKEN OR "${GIT_TOKEN}" STREQUAL "")
    message(FATAL_ERROR "GIT_TOKEN not available")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Existing repository **name**:")
input(REPO_NAME)
message(${REPO_NAME})

execute_process(
	COMMAND git config --global credential.helper ""
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
	
execute_process(
    COMMAND git 
    clone
    "https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
    WORKING_DIRECTORY $ENV{GOPATH}/src/github.com/dirkarnez)
	
execute_process(
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat
    "${DOWNLOADS_DIR}\\VSCode-win32-x64-1.66.1\\Code.exe" 
	--extensions-dir "$ENV{VSCODE_EXTENSION_PATH}" 
	--user-data-dir "$ENV{VSCODE_USER_DATA_PATH}"
	"."
	WORKING_DIRECTORY $ENV{GOPATH}/src/github.com/dirkarnez/${REPO_NAME})