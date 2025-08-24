include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/flac-1.4.2-win/flac-1.4.2-win/Win64/flac.exe")
	download_file_and_uncompress("https://ftp.osuosl.org/pub/xiph/releases/flac/flac-1.4.2-win.zip")
else()
	message("found flac")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\flac-1.4.2-win\\flac-1.4.2-win\\Win64")


