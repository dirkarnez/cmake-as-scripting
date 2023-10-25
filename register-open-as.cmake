string(REPLACE "\\" "\\\\" CMAKE_USERPROFILE "$ENV{USERPROFILE}")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg.in" "${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg" @ONLY)

execute_process(
	COMMAND reg import open-as.reg
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/common
	OUTPUT_STRIP_TRAILING_WHITESPACE)

file(REMOVE "${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg")