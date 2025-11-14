include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://dl.google.com/android/repository/platform-tools-latest-windows.zip")

set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}/Downloads/platform-tools-latest-windows/platform-tools")

message("Directory")
input(DIRECTORY)
message("${DIRECTORY}")

execute_process(
    COMMAND cmd
    WORKING_DIRECTORY ${DIRECTORY})