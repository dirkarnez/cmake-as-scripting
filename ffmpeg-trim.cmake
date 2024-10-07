include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/ffmpeg.cmake OPTIONAL RESULT_VARIABLE FFMPEG_IS_FOUND)
if (FFMPEG_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

message("file")
input(file)

# file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)
# message(${file})

get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${file} NAME_WLE)

set(ENV{PATH} "$ENV{USERPROFILE}\\Downloads\\ffmpeg-6.0-full_build-shared\\ffmpeg-6.0-full_build-shared\\bin")

execute_process(
	COMMAND ffmpeg -ss 1:36 -to 1:40 -i "${file}" -c:v copy -c:a copy "${FILE_NAME_WITHOUT_EXTENSION}-converted.mp4"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)