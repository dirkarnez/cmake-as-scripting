include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_run("https://github.com/horsicq/XMachOViewer/releases/download/0.04/xmachoviewer_win64_portable_0.04.zip")