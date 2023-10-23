include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake)

if(NOT DEFINED GIT_TOKEN OR "${GIT_TOKEN}" STREQUAL "")
    message(FATAL_ERROR "GIT_TOKEN not available")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Existing repository **name**:")
input(REPO_NAME)
message(${REPO_NAME})

execute_process(
	COMMAND git config --global credential.helper ""
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
	
execute_process(
    COMMAND git 
    clone
    "https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
    WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")

 
if(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/go.mod" OR EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/main.go")    
    message(STATUS "Golang project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/go.cmake OPTIONAL RESULT_VARIABLE GO_IS_FOUND)
	if (GO_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "GO_IS_FOUND: ${GO_IS_FOUND}")
	endif()

	# 1.21.0
	setup_go("1.17.5")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/package.json")
    message(STATUS "Node.js project")
	
	include(${CMAKE_CURRENT_SOURCE_DIR}/common/node.cmake OPTIONAL RESULT_VARIABLE NODE_IS_FOUND)
	if (NODE_IS_FOUND STREQUAL "NOTFOUND")
		message(FATAL_ERROR "NODE_IS_FOUND:{${NODE_IS_FOUND}")
	endif()

	setup_node("18.18.0")
elseif(EXISTS "$ENV{USERPROFILE}/Downloads/${REPO_NAME}/CMakeLists.txt")
    message(STATUS "CMake project")
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
