string(REPLACE "\\" "\\\\" CMAKE_GIT_TOKEN "$ENV{GIT_TOKEN}")

if("${CMAKE_GIT_TOKEN}" STREQUAL "")
    message(STATUS "CMAKE_GIT_TOKEN is empty or undefined.")
endif()

configure_file("${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake.in" "${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake" @ONLY)

file(REMOVE "${CMAKE_CURRENT_LIST_DIR}/common/open-as.reg")
