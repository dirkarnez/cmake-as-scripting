include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Executable file")
input(EXE)
message(${EXE})


execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached-without-admin.bat 
	"${EXE}"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)