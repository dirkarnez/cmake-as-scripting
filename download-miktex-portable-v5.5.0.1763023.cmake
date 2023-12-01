include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/miktex-portable-v5.5.0.1763023/miktex-portable.cmd")
	download_file_and_uncompress("https://github.com/dirkarnez/miktex-portable/releases/download/v5.5.0.1763023/miktex-portable-v5.5.0.1763023.zip")
endif()