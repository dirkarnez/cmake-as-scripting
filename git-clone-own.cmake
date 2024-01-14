include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message("utils.cmake not available")
endif()

if(NOT DEFINED GIT_TOKEN OR "${GIT_TOKEN}" STREQUAL "")
    message("GIT_TOKEN not available")
	pause_and_exit_error()
endif()

message("Existing repository **name**:")
input(REPO_NAME)
message(${REPO_NAME})

execute_process(
	COMMAND git config --global credential.helper ""
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
	
if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}")
	message("Not exists")
	execute_process(
		COMMAND git 
		clone
		--recurse-submodules 
		"https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
		WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
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
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/go.cmake OPTIONAL RESULT_VARIABLE GO_IS_FOUND)
	if (GO_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "GO_IS_FOUND: ${GO_IS_FOUND}")
	endif()
	
	setup_go("1.21.0")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/package.json" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/index.js" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.js")
    message(STATUS "Node.js project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/node.cmake OPTIONAL RESULT_VARIABLE NODE_IS_FOUND)
	if (NODE_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "NODE_IS_FOUND: ${NODE_IS_FOUND}")
	endif()

	setup_node("18.18.0")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/CMakeLists.txt")
    message(STATUS "CMake project")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/Makefile")
    message(STATUS "Makefile project")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/requirements.txt")
    message(STATUS "Python project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/python.cmake OPTIONAL RESULT_VARIABLE PYTHON_IS_FOUND)
	if (PYTHON_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "PYTHON_IS_FOUND: ${PYTHON_IS_FOUND}")
	endif()

	setup_python("3.10.8")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.tex")
    message(STATUS "Tex project")
	
	set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\miktex-portable-v5.5.0.1763023\\texmfs\\install\\miktex\\bin\\x64;$ENV{USERPROFILE}\\Downloads\\strawberry-perl-5.38.0.1-64bit-portable\\perl\\bin")
	# set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\texlive-portable-20231107\\2023\\bin\\windows")
	
	set(START_VSCODE TRUE)
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/index.html")
    message(STATUS "HTML project")
	
	set(START_VSCODE TRUE)
else()
	message(STATUS "Unknown")
	pause_and_exit_error()
endif()


if (START_VSCODE)
	include(${CMAKE_CURRENT_SOURCE_DIR}/download-vscodium.cmake OPTIONAL RESULT_VARIABLE VSCODIUM_IS_FOUND)
	if (VSCODIUM_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "VSCODIUM_IS_FOUND: ${VSCODIUM_IS_FOUND}")
	endif()
		
	execute_process(
		COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
		${VSCODE}
		"."
		WORKING_DIRECTORY "$ENV{USERPROFILE}\\Downloads\\${REPO_NAME}")
endif()
