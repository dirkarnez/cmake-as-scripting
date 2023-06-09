include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

download_file("https://ftp.osuosl.org/pub/xiph/releases/flac/flac-1.4.2-win.zip")

message("Directory")
input(DIRECTORY)
message(${DIRECTORY})

file(GLOB ALL_OF_MY_FLAC_FILES LIST_DIRECTORIES false ${DIRECTORY}/*.flac)

foreach(file ${ALL_OF_MY_FLAC_FILES})
  execute_process(
    COMMAND $ENV{USERPROFILE}/Downloads/flac-1.4.2-win/flac-1.4.2-win/Win64/flac.exe "-d" ${file}
    WORKING_DIRECTORY ${DIRECTORY}
    OUTPUT_STRIP_TRAILING_WHITESPACE)
endforeach()




