include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file("https://gitlab.mister-muffin.de/josch/img2pdf/releases/download/0.6.0/img2pdf.exe")
