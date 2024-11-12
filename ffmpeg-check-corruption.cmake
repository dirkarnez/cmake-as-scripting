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

set(ENV{PATH} "$ENV{USERPROFILE}\\Downloads\\ffmpeg-6.0-full_build-shared\\ffmpeg-6.0-full_build-shared\\bin")
# ffmpeg -i mov_bbb.mp4 -c copy -f null - && echo ok
execute_process(
	COMMAND ffmpeg -i "${file}" -c copy -f null -
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
  RESULT_VARIABLE RESULT
	OUTPUT_STRIP_TRAILING_WHITESPACE)
if(NOT RESULT EQUAL 0)
  message("Possibly a corrupted media file")
  pause_and_exit_error()
endif()
