include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("file")
input(file)

message(${file})

execute_process(
	COMMAND yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" "${file}"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)



	
	