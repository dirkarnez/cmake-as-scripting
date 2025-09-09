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

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/msys64/mingw64.exe")
	download_file_and_uncompress("https://github.com/dirkarnez/msys2-portable/releases/download/v2.29.0/msys2-portable-v2.29.0-mingw64-x86_64.zip")
else()
	message("$ENV{SOFTWARE_DIR}/msys64/mingw64.exe exists")
endif()
