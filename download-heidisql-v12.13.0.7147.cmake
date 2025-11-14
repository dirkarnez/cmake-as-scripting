include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/HeidiSQL_12.13_64_Portable/heidisql.exe")
  download_file_and_uncompress("https://github.com/HeidiSQL/HeidiSQL/releases/download/v12.13.0.7147/HeidiSQL_12.13_64_Portable.zip")
else()
	message("found heidisql.exe")
endif()
