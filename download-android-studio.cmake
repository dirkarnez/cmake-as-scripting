include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.3.2.5/android-studio-2024.3.2.5-windows.zip")
