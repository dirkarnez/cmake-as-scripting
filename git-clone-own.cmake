include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)

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
    WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)
    
execute_process(
	COMMAND cmd /c "$ENV{USERPROFILE}/Downloads/VSCode-win32-x64-1.66.1/Code.cmd"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/${REPO_NAME})
