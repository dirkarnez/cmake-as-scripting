include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("file")
input(file)

# file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)
# message(${file})


get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${file} NAME_WLE)

execute_process(
	COMMAND ffmpeg -i "${file}" -c:v libx264 -crf 18 -c:a aac "${FILE_NAME_WITHOUT_EXTENSION}-converted.mp4"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)




