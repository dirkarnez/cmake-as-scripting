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


execute_process(
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec-detached.bat 
	sharedown.exe
	WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads/sharedown-5.3.1-win"
	OUTPUT_STRIP_TRAILING_WHITESPACE)


