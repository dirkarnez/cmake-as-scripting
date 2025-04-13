include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/JetBrains/kotlin/releases/download/v2.1.10/kotlin-native-prebuilt-windows-x86_64-2.1.10.zip")
