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
	
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\PortableGit\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\cmake-3.22.2-windows-x86_64\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\node-v16.13.1-win-x64")
	
	set(ENV{VSCODE_EXTENSION_PATH} "P:\\Downloads\\vscode-data\\extensions")
	set(ENV{VSCODE_USER_DATA_PATH} "P:\\Downloads\\vscode-data\\user-data")
	
	if(NOT EXISTS $ENV{VSCODE_EXTENSION_PATH})
		# Create the directory
		file(MAKE_DIRECTORY $ENV{VSCODE_EXTENSION_PATH})
	endif()

	if(NOT EXISTS $ENV{VSCODE_USER_DATA_PATH})
		# Create the directory
		file(MAKE_DIRECTORY $ENV{VSCODE_USER_DATA_PATH})
	endif()

	message("${DOWNLOADS_DIR}")
	message("$ENV{PATH}")
	message("$ENV{VSCODE_EXTENSION_PATH}")
	message("$ENV{VSCODE_USER_DATA_PATH}")
	
	
endif()


