function(new_repo from_template)    
    include(${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake)

    if(NOT DEFINED GIT_TOKEN)
        message("???")
        # generate one
    endif()

    include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
    if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
        message("???")
        # generate one
    endif()

    message("New repository name:")
    input(NEW_REPO_NAME)
    message(${NEW_REPO_NAME})
    execute_process(COMMAND curl 
        "-L" 
        "-X" "POST"
        "-H" "Accept: application/vnd.github+json"
        "-H" "Authorization: Bearer ${GIT_TOKEN}"
        "-H" "X-GitHub-Api-Version: 2022-11-28"
        "https://api.github.com/repos/dirkarnez/${from_template}/generate"
        "-d"
        "{\"owner\":\"dirkarnez\",\"name\":\"${NEW_REPO_NAME}\"}"
        WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")

    # GitHub needs some time
    sleep()

    execute_process(
        COMMAND git 
        "clone" 
        "https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${NEW_REPO_NAME}.git"
        WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")
endfunction()

