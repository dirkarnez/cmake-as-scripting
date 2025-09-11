include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()


include(${CMAKE_CURRENT_SOURCE_DIR}/common/irfanview.cmake OPTIONAL RESULT_VARIABLE IFRANVIEW_IS_FOUND)
if (IFRANVIEW_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

message("input_file")
input(input_file)
message("input_file ${input_file}")

message("output_file")
input(output_file)
message("output_file ${output_file}")

execute_process(
	COMMAND i_view64.exe "${input_file}" /hflip /convert="${output_file}"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)
	
# Windows: ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null NUL 
# Linux: ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null /dev/null
# The -vn, -sn, and -dn arguments instruct ffmpeg to ignore non-audio streams during this analysis. This drastically speeds up the analysis.