include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOT_FOUND")
    message(FATAL_ERROR "???")
    # generate one
endif()

set(ENV{PATH} "$ENV{SOFTWARE_DIR}\\OpenJDK8U-jdk_x64_windows_hotspot_8u382b05\\jdk8u382-b05\\jre\\bin")

message("$ENV{PATH}")

message("JAR path")
input(JAR_PATH)
message("${JAR_PATH}")

# if("${DIRECTORY}" STREQUAL ".")
# 	set(DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
# endif()


# COMMAND java.exe -jar ${JAR_PATH} --server.port=9000
execute_process(
  COMMAND java.exe -jar ${JAR_PATH}
  WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads"
)