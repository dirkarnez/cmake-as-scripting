include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress(
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.001"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.002"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.003"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.004"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.005"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.006"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.007"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.008"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.009"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.010"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.011"
"https://github.com/dirkarnez/STM32CubeIDE-portable/releases/download/v1.6.1/STM32CubeIDE-portable-v1.6.1.zip.012"
)

file(RENAME "$ENV{USERPROFILE}\\Downloads\\STM32CubeIDE-portable-v1.6.1.zip" "$ENV{USERPROFILE}\\Downloads\\STM32CubeIDE-portable-v1.6.1")

# download_file_and_uncompress("https://github.com/dirkarnez/keil-mdk-portable-launcher/releases/download/v1.0.0/keil-mdk-portable-launcher-v1.0.0.zip")

# file(RENAME "$ENV{USERPROFILE}\\Downloads\\keil-mdk-portable-launcher-v1.0.0\\UV4.Portable.exe" "$ENV{USERPROFILE}\\Downloads\\Keil_v5.38a_with_packages\\UV4.Portable.exe")

# file(REMOVE_RECURSE "$ENV{USERPROFILE}\\Downloads\\keil-mdk-portable-launcher-v1.0.0")