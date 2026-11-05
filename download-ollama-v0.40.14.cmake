include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# https://developer.android.com/studio#get-android-studio
download_file_and_uncompress("https://github.com/ollama/ollama/releases/download/v0.40.14/ollama-windows-amd64.zip")
