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


# ffmpeg -i 26192345-b111-4ec4-8608-b3d4008da756.object.mp4 -i 5db47ce7-559d-4c17-a58f-b3d4008d9b8b-92efec12-c57b-41fa-9dbe-b3d400ac581f.mp4 -c copy -map 0:v:0 -map 1:a:0 output.mp4

# execute_process(
#  	COMMAND ffmpeg -i "${file}" -crf ${crf} -vf "transpose=clock,transpose=clock" "${FILE_NAME_WITHOUT_EXTENSION}-converted.mp4"
# 	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
# 	OUTPUT_STRIP_TRAILING_WHITESPACE)




