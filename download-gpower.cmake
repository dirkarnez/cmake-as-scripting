include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/dirkarnez/GPower-portable/releases/download/v3.1.9.7.143/gpower-portable-v3.1.9.7.143.zip")
