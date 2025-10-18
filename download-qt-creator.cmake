include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# download_file("https://download.qt.io/official_releases/qtcreator/17.0/17.0.2/qt-creator-opensource-windows-x86_64-17.0.2.exe")
download_file_and_uncompress("https://ftp.jaist.ac.jp/pub/qtproject/official_releases/qtcreator/17.0/17.0.2/installer_source/windows_x64/qtcreator.7z")
