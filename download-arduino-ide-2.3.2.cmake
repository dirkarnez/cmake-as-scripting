include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/arduino-ide_2.3.2_Windows_64bit/Arduino IDE.exe")
	download_file_and_uncompress("https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.2_Windows_64bit.zip")
endif()
