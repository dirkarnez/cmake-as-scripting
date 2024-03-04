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

execute_process(
	COMMAND ffmpeg -i "${file}" -af "volumedetect" -vn -sn -dn -f null NUL
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)
	

	
# Windows: ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null NUL 
# Linux: ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null /dev/null
# The -vn, -sn, and -dn arguments instruct ffmpeg to ignore non-audio streams during this analysis. This drastically speeds up the analysis.