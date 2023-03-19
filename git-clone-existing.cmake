include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)

if(NOT DEFINED GIT_TOKEN)
    message(FATAL "???")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message(FATAL "???")
    # generate one
endif()

message("Existing repository **name**:")
input(REPO_NAME)
message(${REPO_NAME})

execute_process(
    COMMAND git 
    "clone" 
    "https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})