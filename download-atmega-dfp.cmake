include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

# search "ATmega_DFP" on http://packs.download.atmel.com/ 
download_file_and_uncompress("http://packs.download.atmel.com/Atmel.ATmega_DFP.2.1.506.atpack")



