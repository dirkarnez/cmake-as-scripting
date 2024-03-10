include(${CMAKE_CURRENT_LIST_DIR}/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message(FATAL_ERROR "UTILS_IS_FOUND: ${UTILS_IS_FOUND}")
endif()

set(suffix "_download_link")
set(18_18_0${suffix} "https://nodejs.org/dist/v18.18.0/node-v18.18.0-win-x64.zip")

function(setup_node version)
    set(download_url "")

    if("${version}" STREQUAL "18.18.0")
        message("setting up node 18.18.0")
        set(download_url "${18_18_0${suffix}}")
    # elseif("${version}" STREQUAL "1.21.0")
    #     message("setting up go 1.21.0")
    #     set(download_url "${1_21_0${suffix}}")
    endif()

    get_filename_from_url_without_extension(${download_url} FILE_NAME_WITHOUT_EXTENSION_FROM_URL)

    if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}/${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}/node.exe")
        message("node with version ${version} not found, downloading")
        download_file_and_uncompress(${download_url})
    else()
        message("node with version ${version} found")
    endif()
    
    set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64")
    set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64\\bin")
	
	set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}")
	message("$ENV{PATH}")
endfunction()