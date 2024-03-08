string(REPLACE "\\" "\\\\" CMAKE_GIT_TOKEN "$ENV{GIT_TOKEN}")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake.in" "${CMAKE_CURRENT_SOURCE_DIR}/common/secrets.cmake" @ONLY)

file(REMOVE "${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg")
