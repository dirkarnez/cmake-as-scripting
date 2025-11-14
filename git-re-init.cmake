include(${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake)

if(NOT DEFINED GIT_TOKEN OR "${GIT_TOKEN}" STREQUAL "")
    message(FATAL_ERROR "GIT_TOKEN not available")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOT_FOUND")
    message(FATAL_ERROR "???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake)

find_exe("git")

message("Directory")
input(DIRECTORY)

if("${DIRECTORY}" STREQUAL ".")
	set(DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endif()

message("${DIRECTORY}")

execute_process(
	COMMAND git config --get remote.origin.url
	OUTPUT_VARIABLE REMOTE_ORIGIN_URL
	WORKING_DIRECTORY "${DIRECTORY}"
	OUTPUT_STRIP_TRAILING_WHITESPACE)
	
message("remote.origin.url = ${REMOTE_ORIGIN_URL}")
string(REGEX REPLACE "dirkarnez:ghp_[^@]+" "dirkarnez:${GIT_TOKEN}" REMOTE_ORIGIN_URL "${REMOTE_ORIGIN_URL}")


execute_process(
	COMMAND cmake -E rm -rf .git
	WORKING_DIRECTORY "${DIRECTORY}")

execute_process(
	COMMAND git config --global init.defaultBranch main
	WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND git init
	WORKING_DIRECTORY "${DIRECTORY}")

execute_process(
	COMMAND git remote add origin ${REMOTE_ORIGIN_URL}
	WORKING_DIRECTORY "${DIRECTORY}")

execute_process(
	COMMAND git config user.name "dirkarnez"
	WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND git config user.email "smalldirkalex@gmail.com"
	WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND git config credential.helper ""
	WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND git git add *
	WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND git commit -m "- init"
	WORKING_DIRECTORY "${DIRECTORY}")

execute_process(
	COMMAND git branch -M main
	WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND git push --force -u origin main
	WORKING_DIRECTORY "${DIRECTORY}")

pause()
