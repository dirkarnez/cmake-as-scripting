include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/task_windows_amd64/task.exe")
	download_file_and_uncompress("https://github.com/go-task/task/releases/download/nightly/task_windows_amd64.zip")
else()
	message("$ENV{SOFTWARE_DIR}\\task_windows_amd64\\task.exe exists")
endif()
