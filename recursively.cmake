include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "utils.cmake not available")
    message(FATAL_ERROR "???")
    # generate one
endif()

message("Directory")
input(DIRECTORY)

file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)
message("${DIRECTORY_NORMALIZED}")

file(GLOB_RECURSE ALL_OF_MY_FILES LIST_DIRECTORIES false ${DIRECTORY_NORMALIZED}/*)

foreach(x ${ALL_OF_MY_FILES})
	message("${x}")
endforeach()