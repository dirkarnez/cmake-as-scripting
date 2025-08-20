include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("utils.cmake not available")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake OPTIONAL RESULT_VARIABLE SECRETS_IS_FOUND)
if (SECRETS_IS_FOUND STREQUAL "NOTFOUND")
    message("secrets.cmake not available")
    pause_and_exit_error()
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake)

if(NOT DEFINED GIT_TOKEN OR "${GIT_TOKEN}" STREQUAL "")
    message("GIT_TOKEN not available")
	pause_and_exit_error()
else()
	message("GIT_TOKEN ${GIT_TOKEN}")
endif()

find_exe("git")

message("Existing repository **name**:")
input(REPO_NAME)
message(${REPO_NAME})

execute_process(
	COMMAND git config --global credential.helper ""
	WORKING_DIRECTORY "$ENV{USERPROFILE}")
	
if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}")
	message("Not exists, cloning...")
	
	execute_process(
		COMMAND git 
		config
		--global
		core.longpaths
		true
		RESULT_VARIABLE IS_OK
		WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
		
	if(NOT "${IS_OK}" STREQUAL "0")
		execute_process(
		COMMAND "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" 
		"-command"
		"Add-Type -AssemblyName System.Windows.Forms;[System.Windows.Forms.MessageBox]::Show($THIS, 'Cannot config git.exe','Error','OK','warning')"
		WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
	endif()
	
	execute_process(
		COMMAND git 
		clone
		--recurse-submodules 
		"https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
		RESULT_VARIABLE IS_OK
		WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
	if(NOT "${IS_OK}" STREQUAL "0")
		execute_process(
			COMMAND "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" 
			"-command"
			"Add-Type -AssemblyName System.Windows.Forms;[System.Windows.Forms.MessageBox]::Show($THIS, 'Cannot clone! Typos or invalid GitHub token','Error','OK','warning')"
			WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
	endif()
else()
	message(WARNING "$ENV{USERPROFILE}/Downloads/${REPO_NAME} exists")
endif()

set(START_VSCODE FALSE)

function(check_is_keil_mdk_project RETURN_VARIABLE)
	file(TO_CMAKE_PATH "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/" DIRECTORY_NORMALIZED)

	file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false ${DIRECTORY_NORMALIZED}/*)

	foreach(file ${ALL_OF_MY_FILES})
		get_filename_component(FILE_EXTENSION ${file} LAST_EXT)
		if (FILE_EXTENSION STREQUAL ".uvprojx")
			SET(${RETURN_VARIABLE} TRUE PARENT_SCOPE)
		endif()
	endforeach()
endfunction()


check_is_keil_mdk_project(IS_KEIL_MDK_PROJECT)

if(IS_KEIL_MDK_PROJECT)
	message(STATUS "Keil MDK project")
	
	set(START_VSCODE FALSE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/go.mod" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.go")    
    message(STATUS "Golang project")
	
	include(${CMAKE_CURRENT_LIST_DIR}/common/go.cmake OPTIONAL RESULT_VARIABLE GO_IS_FOUND)
	if (GO_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "GO_IS_FOUND: ${GO_IS_FOUND}")
	endif()
	
	setup_go("1.21.0")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/package.json" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/index.js" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.js")
    message(STATUS "Node.js project")
	
	include(${CMAKE_CURRENT_LIST_DIR}/common/node.cmake OPTIONAL RESULT_VARIABLE NODE_IS_FOUND)
	if (NODE_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "NODE_IS_FOUND: ${NODE_IS_FOUND}")
	endif()

	setup_node("18.18.0")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/CMakeLists.txt" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/src/main.cpp")
    message(STATUS "CMake project")
	include(${CMAKE_CURRENT_LIST_DIR}/common/cpp.cmake OPTIONAL RESULT_VARIABLE CPP_IS_FOUND)
	if (CPP_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "CPP_IS_FOUND: ${CPP_IS_FOUND}")
	endif()
	
	setup_cpp()
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/Makefile")
    message(STATUS "Makefile project")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/requirements.txt" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.py")
    message(STATUS "Python project")
	
	include(${CMAKE_CURRENT_LIST_DIR}/common/python.cmake OPTIONAL RESULT_VARIABLE PYTHON_IS_FOUND)
	if (PYTHON_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "PYTHON_IS_FOUND: ${PYTHON_IS_FOUND}")
	endif()

	setup_python("3.10.8")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.tex")
	message(STATUS "Tex project")
	# common/tex.cmake
	set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\miktex-portable-v5.5.0.1763023\\texmfs\\install\\miktex\\bin\\x64;$ENV{USERPROFILE}\\Downloads\\strawberry-perl-5.38.0.1-64bit-portable\\perl\\bin")
	# set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\texlive-portable-20231107\\2023\\bin\\windows")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/index.html")
    message(STATUS "HTML project")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main/main.ino" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.ino")
	message(STATUS "Arduino IDE project")

	include(${CMAKE_CURRENT_LIST_DIR}/common/arduino-ide.cmake OPTIONAL RESULT_VARIABLE ARDUINO_IDE_IS_FOUND)
	if (ARDUINO_IDE_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "ARDUINO_IDE_IS_FOUND: ${ARDUINO_IDE_IS_FOUND}")
	endif()

	setup_arduino_ide("legacy")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/Dockerfile")
    message(STATUS "Docker project")
	
	set(START_VSCODE TRUE)
else()
	message(STATUS "Unknown")
	message("Open VSCode? Y")
	input(STILL_OPEN)
	message("${STILL_OPEN}")
	if (STILL_OPEN STREQUAL "Y")
		set(START_VSCODE TRUE)
	endif()
	# pause_and_exit_error()
endif()


if (START_VSCODE)
	include(${CMAKE_CURRENT_LIST_DIR}/download-vscode.cmake OPTIONAL RESULT_VARIABLE VSCODE_IS_FOUND)
	if (VSCODE_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "VSCODE_IS_FOUND: ${VSCODE_IS_FOUND}")
	endif()
		
	execute_process(
		COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec-detached.bat 
		${VSCODE}
		"."
		WORKING_DIRECTORY "$ENV{USERPROFILE}\\Downloads\\${REPO_NAME}")
endif()
