include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/dirkarnez/autodesk-eagle-free-portable/releases/download/v9.6.2/autodesk-eagle-free-portable-v9.6.2.zip")