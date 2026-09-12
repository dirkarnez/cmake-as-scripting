include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# https://developer.android.com/studio#get-android-studio
download_file_and_uncompress("https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.1.4.7/android-studio-quail4-windows.zip")
