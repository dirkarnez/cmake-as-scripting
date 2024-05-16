include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message(FATAL_ERROR "UTILS_IS_FOUND: ${UTILS_IS_FOUND}")
endif()


set(suffix "_download_link")
set(1_8_19${suffix} "https://downloads.arduino.cc/arduino-1.8.19-windows.zip")

function(setup_arduino_ide version)
    set(download_url "")

    if("${version}" STREQUAL "legacy")
        message("setting up arduino 1.8.19")
        set(download_url "${1_8_19${suffix}}")
    endif()

    get_filename_from_url_without_extension(${download_url} FILE_NAME_WITHOUT_EXTENSION_FROM_URL)

    if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}/arduino-1.8.19/arduino.exe")
        message("arduino with version ${version} not found, downloading")
        download_file_and_uncompress(${download_url})
    else()
        message("arduino with version ${version} found")
    endif()
    
    # set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64")
    # set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64\\bin")

    # set(ENV{GOROOT} "$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}\\go")
    # file(MAKE_DIRECTORY "$ENV{USERPROFILE}\\Downloads\\gopath")
    # set(ENV{GOPATH} "$ENV{USERPROFILE}\\Downloads\\gopath")
    # set(ENV{PATH} "$ENV{PATH};$ENV{GOROOT}\\bin")
    message("$ENV{PATH}")
endfunction()