include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/yt-dlp.cmake OPTIONAL RESULT_VARIABLE YT_DLP_IS_FOUND)
if (YT_DLP_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

message("file")
input(file)
message("${file}")

# --embed-metadata --embed-thumbnail
# --downloader-args "ffmpeg_i:-ss ${start} -to ${end}"
execute_process(
	COMMAND yt-dlp -f "ba[acodec^=mp3]/ba/b" -x --audio-format mp3 "${file}"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)

