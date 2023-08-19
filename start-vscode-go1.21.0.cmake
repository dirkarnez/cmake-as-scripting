include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)

if(NOT EXISTS $ENV{VSCODE_EXTENSION_PATH})
    # Create the directory
    file(MAKE_DIRECTORY $ENV{VSCODE_EXTENSION_PATH})
endif()

if(NOT EXISTS $ENV{VSCODE_USER_DATA_PATH})
    # Create the directory
    file(MAKE_DIRECTORY $ENV{VSCODE_USER_DATA_PATH})
endif()

execute_process(
	COMMAND "${DOWNLOADS_DIR}\\VSCode-win32-x64-1.66.1\\Code.exe" 
	--extensions-dir "$ENV{VSCODE_EXTENSION_PATH}" 
	--user-data-dir "$ENV{VSCODE_USER_DATA_PATH}"
	WORKING_DIRECTORY ${DOWNLOADS_DIR})