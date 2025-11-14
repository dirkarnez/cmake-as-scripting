include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/aria2-1.37.0-win-64bit-build1/aria2-1.37.0-win-64bit-build1/aria2c.exe")
	message("downloading aria2")
	download_file_and_uncompress("https://github.com/aria2/aria2/releases/download/release-1.37.0/aria2-1.37.0-win-64bit-build1.zip")
else()
	message("found aria2")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\aria2-1.37.0-win-64bit-build1\\aria2-1.37.0-win-64bit-build1")