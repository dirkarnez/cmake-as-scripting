include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file("https://portableapps.com/redir2/?a=OpenShotPortable&s=s&d=pa&f=OpenShotPortable_3.1.1.paf.exe")