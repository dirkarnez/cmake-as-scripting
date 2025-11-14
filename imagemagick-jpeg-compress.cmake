include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/ImageMagick.cmake OPTIONAL RESULT_VARIABLE FFMPEG_IS_FOUND)
if (FFMPEG_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("file name without .jpg extension")
input(file)
message("${file}")

message("percentage (100 is no compression)")
input(percentage)
message("${percentage}")

execute_process(
	COMMAND convert "${file}" -quality ${percentage}% "${file}-compressed.jpg"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)




