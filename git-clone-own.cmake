include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message("utils.cmake not available")
	pause_and_exit_error()
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
		"https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
		WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
endif()

 
if(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/go.mod" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.go")    
    message(STATUS "Golang project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/go.cmake OPTIONAL RESULT_VARIABLE GO_IS_FOUND)
	if (GO_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "GO_IS_FOUND: ${GO_IS_FOUND}")
	endif()
	
	setup_go("1.21.0")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/package.json" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/index.js" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.js")
    message(STATUS "Node.js project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/node.cmake OPTIONAL RESULT_VARIABLE NODE_IS_FOUND)
	if (NODE_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "NODE_IS_FOUND: ${NODE_IS_FOUND}")
	endif()

	setup_node("18.18.0")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/CMakeLists.txt")
    message(STATUS "CMake project")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/requirements.txt")
    message(STATUS "Python project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/python.cmake OPTIONAL RESULT_VARIABLE PYTHON_IS_FOUND)
	if (PYTHON_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "PYTHON_IS_FOUND: ${PYTHON_IS_FOUND}")
	endif()

	setup_python("3.10.8")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.tex")
    message(STATUS "Tex project")
	
	set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\miktex-portable-v5.5.0.1763023\\texmfs\\install\\miktex\\bin\\x64;$ENV{USERPROFILE}\\Downloads\\strawberry-perl-5.38.0.1-64bit-portable\\perl\\bin")
	# set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\texlive-portable-20231107\\2023\\bin\\windows")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/index.html")
    message(STATUS "HTML project")
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/apps.cmake OPTIONAL RESULT_VARIABLE APPS_IS_FOUND)
if (APPS_IS_FOUND STREQUAL "NOTFOUND")
    message(FATAL_ERROR "APPS_IS_FOUND: ${APPS_IS_FOUND}")
endif()

	
execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
	${VSCODE}
	"."
	WORKING_DIRECTORY "$ENV{USERPROFILE}\\Downloads\\${REPO_NAME}")
