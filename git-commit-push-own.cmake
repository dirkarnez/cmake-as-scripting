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

message("Directory")
input(DIRECTORY)

if(${DIRECTORY} STREQUAL "\.")
	set(DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endif()

message("${DIRECTORY}")

execute_process(
	COMMAND git config user.name "dirkarnez"
	WORKING_DIRECTORY ${DIRECTORY})
	
execute_process(
	COMMAND git config user.email "smalldirkalex@gmail.com"
	WORKING_DIRECTORY ${DIRECTORY})
	
execute_process(
	COMMAND git config credential.helper ""
	WORKING_DIRECTORY ${DIRECTORY})
	
execute_process(
    COMMAND git add *
    WORKING_DIRECTORY ${DIRECTORY})
	
execute_process(
    COMMAND git commit -m "- upload files" 
    WORKING_DIRECTORY ${DIRECTORY})
	
execute_process(
    COMMAND git branch -M main
    WORKING_DIRECTORY ${DIRECTORY})
	
execute_process(
    COMMAND git push -u origin main
    WORKING_DIRECTORY ${DIRECTORY})