include(${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

execute_process(
	COMMAND curl -s https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive
	OUTPUT_VARIABLE REDIRECTED_INFORMATION
	WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
	OUTPUT_STRIP_TRAILING_WHITESPACE)
	
get_filename_component(FILE_NAME_WITHOUT_EXTENSION 
	${REDIRECTED_INFORMATION}
	NAME_WLE)
	
if(NOT EXISTS "$ENV{SOFTWARE_DIR}/${FILE_NAME_WITHOUT_EXTENSION}/Code.exe")
	string(REGEX MATCH https://.*.zip REDIRECTED_URL ${REDIRECTED_INFORMATION})
	message("latest version vscode not found, downloading... ${REDIRECTED_URL}")
	download_file_and_uncompress("${REDIRECTED_URL}")
	if(NOT EXISTS "$ENV{SOFTWARE_DIR}/${FILE_NAME_WITHOUT_EXTENSION}/data")
		# portable mode
		file(MAKE_DIRECTORY "$ENV{SOFTWARE_DIR}\\${FILE_NAME_WITHOUT_EXTENSION}\\data")
	endif()
else()
	message("latest version vscode found")
endif()

# portable mode
file(MAKE_DIRECTORY "$ENV{SOFTWARE_DIR}\\${FILE_NAME_WITHOUT_EXTENSION}\\data")

set(VSCODE "$ENV{SOFTWARE_DIR}\\${FILE_NAME_WITHOUT_EXTENSION}\\Code.exe")
