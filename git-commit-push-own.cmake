include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)

if(NOT DEFINED GIT_TOKEN OR "${GIT_TOKEN}" STREQUAL "")
    message(FATAL_ERROR "GIT_TOKEN not available")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Directory")
input(DIRECTORY)

execute_process(
	COMMAND git config --global credential.helper ""
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