include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/aria2.cmake OPTIONAL RESULT_VARIABLE ARIA2_IS_FOUND)
if (ARIA2_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

# TODO add torrent file later

message("magnet link")
input(magnet_link)
message("${magnet_link}")

execute_process(
	COMMAND aria2c --seed-time=0 ${magnet_link} -d "aria2c-downloads"  
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)
