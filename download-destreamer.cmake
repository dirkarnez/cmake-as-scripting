include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

execute_process(
    COMMAND git 
    "clone" 
    "https://github.com/snobu/destreamer.git"
    WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)

execute_process(
	COMMAND npm.cmd 
	"install"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/destreamer)

execute_process(
	COMMAND npm.cmd 
	"run-script"
	"build"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/destreamer)
