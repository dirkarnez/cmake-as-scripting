include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/kdenlive-25.08.0_standalone/bin/kdenlive.exe")
  download_file_and_uncompress("https://mirrors.xtom.hk/kde/stable/kdenlive/25.08/windows/kdenlive-25.08.0_standalone.exe")
else()
	message("found kdenlive.exe")
endif()
