set(suffix "_download_link")
# set(1_17_5${suffix} "https://go.dev/dl/go1.17.5.windows-amd64.zip")
# set(1_21_0${suffix} "https://go.dev/dl/go1.21.0.windows-amd64.zip")

function(setup_cpp)
    set(download_url "")

    # if("${version}" STREQUAL "1.17.5")
    #    message("setting up go 1.17.5")
    #    set(download_url "${1_17_5${suffix}}")
    #elseif("${version}" STREQUAL "1.21.0")
    #    message("setting up go 1.21.0")
    #    set(download_url "${1_21_0${suffix}}")
    #endif()

    #get_filename_from_url_without_extension(${download_url} FILE_NAME_WITHOUT_EXTENSION_FROM_URL)

    #if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}/go/bin/go.exe")
    #    message("go with version ${version} not found, downloading")
    #    download_file_and_uncompress(${download_url})
    #else()
    #    message("go with version ${version} found")
    #endif()


	# .
	include(${CMAKE_CURRENT_SOURCE_DIR}/download-vscodium.cmake OPTIONAL RESULT_VARIABLE VSCODIUM_IS_FOUND)
	if (VSCODIUM_IS_FOUND STREQUAL "NOTFOUND")
		message("???")
		# generate one
	endif()
	
	if(EXISTS "$ENV{USERPROFILE}/Downloads/VSCodium-win32-x64-${TAG_NAME}/VSCodium.exe")
		include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
		if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
			message("???")
			# generate one
		endif()

		download_file("https://github.com/microsoft/vscode-cpptools/releases/download/v1.19.6/cpptools-win64.vsix")
		
		execute_process(
			COMMAND codium.cmd --install-extension=$ENV{USERPROFILE}\\Downloads\\cpptools-win64.vsix
			WORKING_DIRECTORY "$ENV{USERPROFILE}\\Downloads\\VSCodium-win32-x64-${TAG_NAME}\\bin")
	endif()
    
    set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64")
    set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\mingw64\\bin")

    #set(ENV{GOPATH} "P:\\Downloads\\gopath")
    #set(ENV{GOROOT} "$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION_FROM_URL}\\go")
    #set(ENV{PATH} "$ENV{PATH};$ENV{GOROOT}\\bin")
endfunction()