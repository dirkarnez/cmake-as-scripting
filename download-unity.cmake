include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress(
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.001"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.002"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.003"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.004"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.005"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.006"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.007"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.008"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.009"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.010"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.011"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.012"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.013"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.014"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.015"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.016"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.017"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.018"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.019"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.020"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.021"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.022"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.023"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.024"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.025"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.026"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.027"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.028"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.029"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.030"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.031"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.032"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.033"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.034"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.035"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.036"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.037"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.038"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.039"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.040"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.041"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.042"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.043"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.044"
"https://github.com/dirkarnez/unity-portable/releases/download/6000.2.7f2/unity-portable-6000.2.7f2.045"
)

# file(RENAME "$ENV{USERPROFILE}\\Downloads\\STM32CubeIDE-portable-v1.6.1.zip" "$ENV{USERPROFILE}\\Downloads\\STM32CubeIDE-portable-v1.6.1")

# download_file_and_uncompress("https://github.com/dirkarnez/keil-mdk-portable-launcher/releases/download/v1.0.0/keil-mdk-portable-launcher-v1.0.0.zip")

# file(RENAME "$ENV{USERPROFILE}\\Downloads\\keil-mdk-portable-launcher-v1.0.0\\UV4.Portable.exe" "$ENV{USERPROFILE}\\Downloads\\Keil_v5.38a_with_packages\\UV4.Portable.exe")

# file(REMOVE_RECURSE "$ENV{USERPROFILE}\\Downloads\\keil-mdk-portable-launcher-v1.0.0")