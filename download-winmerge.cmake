include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file("https://github.com/WinMerge/winmerge/releases/download/v2.16.32/winmerge-2.16.32-x64-exe.zip")
