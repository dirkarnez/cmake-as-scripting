include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/devtunnel.exe")
	download_file("https://aka.ms/TunnelsCliDownload/win-x64" "devtunnel.exe")
else()
	message("found devtunnel")
endif()


