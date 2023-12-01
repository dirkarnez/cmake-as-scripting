include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

execute_process(COMMAND C:\\Windows\\System32\\curl.exe 
	-s
	-L 
	-H "Accept: application/vnd.github+json"
	-H "Authorization: Bearer ${GIT_TOKEN}"
	-H "X-GitHub-Api-Version: 2022-11-28"
	"https://api.github.com/repos/VSCodium/vscodium/releases"
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_VARIABLE REDIRECTED_INFORMATION)
	
string(JSON TAG_NAME GET ${REDIRECTED_INFORMATION} 0 "tag_name")

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