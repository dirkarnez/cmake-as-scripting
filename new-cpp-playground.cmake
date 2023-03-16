include("secrets.cmake" OPTIONAL RESULT_VARIABLE SECRET_IS_FOUND)

if (SECRET_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# message(${CMAKE_CURRENT_SOURCE_DIR})
# message(${GIT_TOKEN})

execute_process(COMMAND git 
    "gui" 
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})