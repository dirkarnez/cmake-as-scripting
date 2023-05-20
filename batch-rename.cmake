include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# download_file("https://ftp.osuosl.org/pub/xiph/releases/flac/flac-1.4.2-win.zip")

message("Directory")
input(DIRECTORY)
message(${DIRECTORY})

file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false ${DIRECTORY}/*)

foreach(file ${ALL_OF_MY_FILES})
    string(TOLOWER ${file} FILE_NAME_LOWERED)
    string(REPLACE ".txt" ".go" FILE_EXTENSION_GO ${FILE_NAME_LOWERED})
    file(RENAME ${file} ${FILE_EXTENSION_GO})
endforeach()