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

file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)
message(${DIRECTORY_NORMALIZED})

message("Existing repository **name** without .git:")
input(REPO_NAME)
message(${REPO_NAME})

execute_process(
    COMMAND git 
    "clone" 
    "https://dirkarnez:${GIT_TOKEN}@github.com/dirkarnez/${REPO_NAME}.git"
    WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)

set(list_test 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)

	
foreach(x ${list_test})
	file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false ${DIRECTORY_NORMALIZED}/${x}/*)

	file(COPY ${ALL_OF_MY_FILES} DESTINATION $ENV{USERPROFILE}/Downloads/${REPO_NAME})

	execute_process(
		COMMAND git add *
		WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/${REPO_NAME}
		OUTPUT_STRIP_TRAILING_WHITESPACE)

	execute_process(
		COMMAND git commit -m "- upload files"
		WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/${REPO_NAME}
		OUTPUT_STRIP_TRAILING_WHITESPACE)


	execute_process(
		COMMAND git branch -M main
		WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/${REPO_NAME}
		OUTPUT_STRIP_TRAILING_WHITESPACE)


	execute_process(
		COMMAND git push -u origin main
		WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads/${REPO_NAME}
		OUTPUT_STRIP_TRAILING_WHITESPACE)
endforeach()