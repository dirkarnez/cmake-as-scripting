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

message("file")
input(file)

# file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)
# message("${file}"")

get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${file} NAME_WLE)

message("crf value (0 - 51, 0 is lossless, 23 is the default)")
input(crf)
message("${crf}")

# -vf "transpose=clock,transpose=clock"
execute_process(
 	COMMAND ffmpeg -i "${file}" -crf ${crf} "${FILE_NAME_WITHOUT_EXTENSION}-converted.mp4"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)




