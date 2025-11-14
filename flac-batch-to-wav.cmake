include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/flac.cmake OPTIONAL RESULT_VARIABLE FLAC_IS_FOUND)
if (FLAC_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

message("Directory")
input(DIRECTORY)
message("${DIRECTORY}")

file(GLOB ALL_OF_MY_FLAC_FILES LIST_DIRECTORIES false "${DIRECTORY}/*.flac")
message("${DIRECTORY}")

foreach(file ${ALL_OF_MY_FLAC_FILES})
	message("${file}")
	
	execute_process(
		COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec-detached.bat 
		"$ENV{SOFTWARE_DIR}\\flac-1.4.2-win\\flac-1.4.2-win\\Win64\\flac.exe" 
		"-d" 
		"${file}"
		WORKING_DIRECTORY ${DIRECTORY})
endforeach()





