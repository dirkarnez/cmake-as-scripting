include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://edgedl.me.gvt1.com/edgedl/android/studio/ide-zips/2025.2.2.7/android-studio-2025.2.2.7-windows.zip")
