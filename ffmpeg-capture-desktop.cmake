# https://trac.ffmpeg.org/wiki/Capture/Desktop
# https://github.com/hansalemaos/ffmpeg_screenshot_pipe


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
# message("${file}")

get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${file} NAME_WLE)

# ffmpeg -f gdigrab -framerate 30 -i desktop -c:v libx264 output.mkv -f dshow -i audio="Stereo Mix (Realtek Audio)" output.mkv
# This command has no audio recorded
execute_process(
	COMMAND ffmpeg -f gdigrab -framerate 30 -i desktop -c:v libx264 "${file}.mp4"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)




