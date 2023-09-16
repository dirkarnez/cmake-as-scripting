include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://downloads.arduino.cc/arduino-1.8.19-windows.zip")