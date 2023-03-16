include("secrets.cmake" OPTIONAL RESULT_VARIABLE SECRET_IS_FOUND)

if (SECRET_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()


include("utils.cmake" OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message(${CMAKE_CURRENT_SOURCE_DIR})
message(${GIT_TOKEN})

input(NEW_REPO_NAME)
execute_process(COMMAND curl 
    "-L" 
    "-X" "POST"
    "-H" "Accept: application/vnd.github+json"
    "-H" "Authorization: Bearer ${GIT_TOKEN}"
    "-H" "X-GitHub-Api-Version: 2022-11-28"
    "https://api.github.com/repos/dirkarnez/portaudio-playground/generate"
    "-d"
    "{\"owner\":\"dirkarnez\",\"name\":\"${NEW_REPO_NAME}\"}"
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# GitHub needs some time
sleep()

execute_process(
    COMMAND git 
    "clone" 
    "https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${NEW_REPO_NAME}.git"
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
