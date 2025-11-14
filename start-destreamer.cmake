include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("account (with @connect.polyu.hk): ")
input(account)
message("${account}")

message("input file")
input(inputFile)

execute_process(
	COMMAND node.exe --max-http-header-size 32768 .\build\src\destreamer.js -u "${account}" --inputFile "${inputFile}"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/destreamer)