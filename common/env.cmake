execute_process(
	COMMAND whoami
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
	OUTPUT_STRIP_TRAILING_WHITESPACE)
# string(STRIP ${TEMP} TEMP)
# SET(${RETURN_VARIABLE} ${TEMP} PARENT_SCOPE)

string(SUBSTRING ${CURRENT_USER} 0 3 DOMAIN)
	
message("${CURRENT_USER} ${DOMAIN}")

if("${DOMAIN}" STREQUAL "hh\\" OR "${CURRENT_USER}" STREQUAL "laptop-6bjc4eto\\stude")
	if("${DOMAIN}" STREQUAL "hh\\")
		message("in school")
	endif()

	if("${CURRENT_USER}" STREQUAL "laptop-6bjc4eto\\stude")
		message("in stemex notebook")
	endif()

	set(DOWNLOADS_DIR "$ENV{USERPROFILE}\\Downloads")
	
	set(ENV{PATH} "${DOWNLOADS_DIR}")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\PortableGit\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\cmake-3.22.2-windows-x86_64\\bin")
	
	# set(ENV{VSCODE_EXTENSION_PATH} "P:\\Downloads\\vscode-data\\extensions")
	# set(ENV{VSCODE_USER_DATA_PATH} "P:\\Downloads\\vscode-data\\user-data")
	
	# if(NOT EXISTS $ENV{VSCODE_EXTENSION_PATH})
	# 	# Create the directory
	# 	file(MAKE_DIRECTORY $ENV{VSCODE_EXTENSION_PATH})
	# endif()

	# if(NOT EXISTS $ENV{VSCODE_USER_DATA_PATH})
	# 	# Create the directory
	# 	file(MAKE_DIRECTORY $ENV{VSCODE_USER_DATA_PATH})
	# endif()

	# message("${DOWNLOADS_DIR}")
	message("$ENV{PATH}")
	# message("$ENV{VSCODE_EXTENSION_PATH}")
	# message("$ENV{VSCODE_USER_DATA_PATH}")
endif()