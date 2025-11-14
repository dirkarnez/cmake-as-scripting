include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress("https://github.com/dirkarnez/altium-circuitmaker-portable/releases/download/v2.3.0.3/altium-circuitmaker-portable-v2.3.0.3.zip")