include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file("https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-04-04/oss-cad-suite-windows-x64-20240404.exe")

