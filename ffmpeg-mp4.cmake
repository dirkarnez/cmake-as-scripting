include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/ffmpeg.cmake OPTIONAL RESULT_VARIABLE FFMPEG_IS_FOUND)
if (FFMPEG_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

message("input file")
input(INPUT_FILE)
message("${INPUT_FILE}")

message("file name (without .mp4)")
input(FILE_NAME)
message("${FILE_NAME}")

# file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)


# get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${INPUT_FILE} NAME_WLE)
# message("${FILE_NAME_WITHOUT_EXTENSION}")

execute_process(
	COMMAND ffmpeg -i "${INPUT_FILE}" "${FILE_NAME}.mp4"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)