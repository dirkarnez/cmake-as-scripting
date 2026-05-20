include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# download_file_and_uncompress("https://github.com/dirkarnez/sharedown-portable/releases/download/v5.3.6/sharedown-v5.3.6-portable.zip")
download_file_and_uncompress("https://github.com/dirkarnez/sharedown-portable/releases/download/cf3d587cc3e24f7ff8fe4732e1465cb92eb420be3/sharedown-cf3d587cc3e24f7ff8fe4732e1465cb92eb420be3-portable.zip")


