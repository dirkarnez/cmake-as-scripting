include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/peazip/PeaZip/releases/download/9.4.0/peazip_portable-9.4.0.WIN64.zip")
