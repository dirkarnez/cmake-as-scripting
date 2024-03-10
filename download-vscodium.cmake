include(${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

execute_process(COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec.bat
	curl -s -L "https://api.github.com/repos/VSCodium/vscodium/releases/latest"
	OUTPUT_VARIABLE REDIRECTED_INFORMATION
	OUTPUT_STRIP_TRAILING_WHITESPACE)


string(JSON TAG_NAME GET ${REDIRECTED_INFORMATION} "tag_name")

set(TAG_NAME "1.86.2.24054")

message(STATUS "latest version: ${TAG_NAME}")

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/VSCodium-win32-x64-${TAG_NAME}/VSCodium.exe")
	message("https://github.com/VSCodium/vscodium/releases/download/${TAG_NAME}/VSCodium-win32-x64-${TAG_NAME}.zip")

	download_file_and_uncompress("https://github.com/VSCodium/vscodium/releases/download/${TAG_NAME}/VSCodium-win32-x64-${TAG_NAME}.zip")
else()
	if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/VSCodium-win32-x64-${TAG_NAME}/data")
		# portable mode
		file(MAKE_DIRECTORY "$ENV{USERPROFILE}\\Downloads\\VSCodium-win32-x64-${TAG_NAME}\\data")
	endif()
endif()

set(VSCODE "$ENV{USERPROFILE}\\Downloads\\VSCodium-win32-x64-${TAG_NAME}\\VSCodium.exe")