include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file_and_uncompress(
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.001"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.002"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.003"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.004"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.005"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.006"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.007"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.008"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.009"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.010"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.011"
"https://github.com/dirkarnez/keil-mdk-v5.38a-with-packages-portable/raw/main/Keil_v5.38a_with_packages.zip.012"
)



file(RENAME "$ENV{USERPROFILE}\\Downloads\\Keil_v5.38a_with_packages.zip" "$ENV{USERPROFILE}\\Downloads\\Keil_v5.38a_with_packages")