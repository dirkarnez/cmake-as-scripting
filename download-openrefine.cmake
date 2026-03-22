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

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/openrefine-win-with-java-3.10.0/openrefine-3.10.0/openrefine.exe")
	download_file_and_uncompress("https://github.com/OpenRefine/OpenRefine/releases/download/3.10.0/openrefine-win-with-java-3.10.0.zip")
else()
	message("$ENV{SOFTWARE_DIR}/openrefine-win-with-java-3.10.0/openrefine-3.10.0/openrefine.exe exists")
endif()