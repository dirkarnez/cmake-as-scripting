include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_run("https://github.com/shaka-project/static-ffmpeg-binaries/releases/download/n7.1-2/ffmpeg-win-x64.exe")
