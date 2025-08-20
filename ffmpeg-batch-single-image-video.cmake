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

message("Directory")
input(DIRECTORY)
message("${DIRECTORY}")

file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false "${DIRECTORY}/*")
message("${DIRECTORY}")

foreach(file ${ALL_OF_MY_FILES})
	message("${file}")
	
	# execute_process(
	# 	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
	# 	"$ENV{USERPROFILE}\\Downloads\\flac-1.4.2-win\\flac-1.4.2-win\\Win64\\flac.exe" 
	# 	"-d" 
	# 	"${file}"
	# 	WORKING_DIRECTORY ${DIRECTORY})

	# execute_process(
	# COMMAND ffmpeg -i "${file}" -af "volumedetect" -vn -sn -dn -f null NUL
	# WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)

endforeach()



	

	
# Windows: ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null NUL 
# Linux: ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null /dev/null
# The -vn, -sn, and -dn arguments instruct ffmpeg to ignore non-audio streams during this analysis. This drastically speeds up the analysis.



