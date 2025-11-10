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

include(${CMAKE_CURRENT_SOURCE_DIR}/common/java.cmake OPTIONAL RESULT_VARIABLE JAVA_IS_FOUND)
if (JAVA_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

setup_jdk()

download_file("https://github.com/logisim-evolution/logisim-evolution/releases/download/v4.0.0/logisim-evolution-4.0.0-all.jar" "logisim-evolution-4.0.0-all.jar")

set(ENV{PATH} "$ENV{SOFTWARE_DIR}\\OpenJDK21U-jdk_x64_windows_hotspot_21.0.6_7\\jdk-21.0.6+7\\bin")

execute_process(COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec.bat 
  javaw.exe 
  -jar 
  logisim-evolution-4.0.0-all.jar
  WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads"
)