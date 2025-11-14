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

message("start 00:04:56.00")
input(start)
message("${start}")

message("end 00:04:56.00")
input(end)
message("${end}")

# --embed-metadata --embed-thumbnail
# --downloader-args "ffmpeg_i:-ss ${start} -to ${end}"
execute_process(
	COMMAND yt-dlp -f "ba[acodec^=mp3]/ba/b" -x --audio-format mp3 "${file}" --postprocessor-args "-ss ${start} -to ${end}"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)

