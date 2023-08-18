execute_process(
	COMMAND whoami
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	OUTPUT_STRIP_TRAILING_WHITESPACE)
# string(STRIP ${TEMP} TEMP)
# SET(${RETURN_VARIABLE} ${TEMP} PARENT_SCOPE)

string(SUBSTRING ${CURRENT_USER} 0 3 DOMAIN)
	
message("${CURRENT_USER} ${DOMAIN}")

if("${DOMAIN}" STREQUAL "hh\\")
	message("in school")
	
	set(DOWNLOADS_DIR "$ENV{USERPROFILE}\\Downloads")
	set(ENV{GOROOT} "${DOWNLOADS_DIR}\\go1.21.0.windows-amd64\\go")
	set(ENV{GOPATH} "P:\\Downloads\\gopath")

	set(ENV{VSCODE_EXTENSION_PATH} "P:\\Downloads\\vscode-data\\extensions")
	set(ENV{VSCODE_USER_DATA_PATH} "P:\\Downloads\\vscode-data\\user-data")

	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}")
	set(ENV{PATH} "$ENV{PATH};${GOROOT}\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\PortableGit\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\cmake-3.22.2-windows-x86_64\\bin")
endif()


