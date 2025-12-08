execute_process(
	COMMAND C:\\Windows\\System32\\whoami.exe
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
	OUTPUT_STRIP_TRAILING_WHITESPACE)
# string(STRIP ${TEMP} TEMP)
# SET(${RETURN_VARIABLE} ${TEMP} PARENT_SCOPE)

string(SUBSTRING ${CURRENT_USER} 0 3 DOMAIN)
	
message("${CURRENT_USER} ${DOMAIN}")

set(DOWNLOADS_DIR "$ENV{USERPROFILE}\\Downloads")

set(ENV{PATH} "$ENV{PATH};C:\\Windows\\System32")

if("${CURRENT_USER}" STREQUAL "administrator\\administrator")
	message("My notebook")
 
	set(ENV{SOFTWARE_DIR} "D:\\Softwares")
	
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}")
	set(ENV{PATH} "$ENV{PATH};D:\\Softwares\\PortableGit\\bin")
	set(ENV{PATH} "$ENV{PATH};D:\\Softwares\\PortableGit\\usr\\bin")
	set(ENV{PATH} "$ENV{PATH};D:\\Softwares\\cmake-3.29.3-windows-x86_64\\bin")
	set(ENV{PATH} "$ENV{PATH};D:\\Softwares\\curl-8.7.1_9-win64-mingw\\bin")
else()
	if("${DOMAIN}" STREQUAL "hh\\")
		message("in school")
	endif()

	if("${CURRENT_USER}" STREQUAL "laptop-6bjc4eto\\stude")
		message("in stemex notebook")
	endif()

	set(ENV{SOFTWARE_DIR} "${DOWNLOADS_DIR}")
  
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\PortableGit\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\cmake-3.26.1-windows-x86_64\\bin")
	set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\curl-8.6.0_4-win64-mingw\\curl-8.6.0_4-win64-mingw\\bin")
	
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
