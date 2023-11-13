set(suffix "_download_link")
set(3_10_8${suffix} "https://github.com/dirkarnez/python-portable/releases/download/v3.10.8/python-3.10.8-amd64-portable.zip")

function(setup_python version)
    set(download_url "")

    if("${version}" STREQUAL "3.10.8")
        message("setting up python 3.10.8")
        set(download_url "${3_10_8${suffix}}")
	else()
		message("unsupported python version")
    endif()
	
    get_filename_from_url_without_extension(${download_url} FILE_NAME_WITHOUT_EXTENSION_FROM_URL)

    if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}/python.exe")
        message("python with version ${version} not found, downloading")
        download_file_and_uncompress(${download_url})
    else()
        message("python with version ${version} found")
    endif()
    
    set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL};$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}\\Scripts")
endfunction()