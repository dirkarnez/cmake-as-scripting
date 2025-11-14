include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/xpack-dev-tools/aarch64-none-elf-gcc-xpack/releases/download/v13.2.1-1.1/xpack-aarch64-none-elf-gcc-13.2.1-1.1-win32-x64.zip")
