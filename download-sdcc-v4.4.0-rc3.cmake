include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/dirkarnez/sdcc-portable/releases/download/v4.4.0-rc3/sdcc-portable-v4.4.0-rc3.zip")


