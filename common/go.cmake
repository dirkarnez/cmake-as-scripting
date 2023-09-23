set(suffix "_download_link")
set(1_17_5${suffix} "https://go.dev/dl/go1.17.5.windows-amd64.zip")
set(1_21_0${suffix} "https://go.dev/dl/go1.21.0.windows-amd64.zip")

function(setup_go version)
    set(download_url "")

    if("${version}" STREQUAL "1.17.5")
        message("setting up go 1.17.5")
        set(download_url "${1_17_5${suffix}}")
    elseif("${version}" STREQUAL "1.21.0")
        message("setting up go 1.21.0")
        set(download_url "${1_21_0${suffix}}")
    endif()

    get_filename_from_url_without_extension(${download_url} FILE_NAME_WITHOUT_EXTENSION_FROM_URL)

    if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}/go/bin/go.exe")
        message("go with version ${version} not found, downloading")
        download_file_and_uncompress(${download_url})
    else()
        message("go with version ${version} found")
    endif()

    
    set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64")
    set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64\\bin")

    set(ENV{GOPATH} "P:\\Downloads\\gopath")
    set(ENV{GOROOT} "$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}\\go")
    set(ENV{PATH} "$ENV{PATH};$ENV{GOROOT}\\bin")
endfunction()


