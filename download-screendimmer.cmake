include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/dirkarnez/ScreenDimmer/releases/download/v1.0.0/ScreenDimmer-v1.0.0-winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1.zip")
