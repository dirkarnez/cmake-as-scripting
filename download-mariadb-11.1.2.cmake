include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# download_file_and_uncompress("https://dlm.mariadb.com/3407681/MariaDB/mariadb-11.1.2/winx64-packages/mariadb-11.1.2-winx64.zip")
download_file_and_uncompress("https://github.com/dirkarnez/mariadb-portable/releases/download/v11.1.2/mariadb-11.1.2-winx64.zip")
