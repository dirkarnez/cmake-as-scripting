include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress(
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.001"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.002"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.003"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.004"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.005"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.006"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.007"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.008"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.009"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.010"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.011"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.012"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.013"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.014"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.015"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.016"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.017"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.018"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.019"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.020"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.021"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.022"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.023"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.024"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.025"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.026"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.027"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.028"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.029"
"https://github.com/dirkarnez/unity-portable/releases/download/2023.1.17f1/unity-portable-2023.1.17f1.030"
)

# file(RENAME "$ENV{USERPROFILE}\\Downloads\\STM32CubeIDE-portable-v1.6.1.zip" "$ENV{USERPROFILE}\\Downloads\\STM32CubeIDE-portable-v1.6.1")

# download_file_and_uncompress("https://github.com/dirkarnez/keil-mdk-portable-launcher/releases/download/v1.0.0/keil-mdk-portable-launcher-v1.0.0.zip")

# file(RENAME "$ENV{USERPROFILE}\\Downloads\\keil-mdk-portable-launcher-v1.0.0\\UV4.Portable.exe" "$ENV{USERPROFILE}\\Downloads\\Keil_v5.38a_with_packages\\UV4.Portable.exe")

# file(REMOVE_RECURSE "$ENV{USERPROFILE}\\Downloads\\keil-mdk-portable-launcher-v1.0.0")