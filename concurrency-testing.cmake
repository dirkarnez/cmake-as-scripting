string(UUID FIRST_UUID NAMESPACE 6ba7b810-9dad-11d1-80b4-00c04fd430c8 NAME 1 TYPE SHA1)
string(UUID SECOND_UUID NAMESPACE 6ba7b810-9dad-11d1-80b4-00c04fd430c8 NAME 2 TYPE SHA1)

file(GLOB_RECURSE ALL_OF_MY_FILES LIST_DIRECTORIES false "${CMAKE_CURRENT_LIST_DIR}/temp/*.download_completed")
list(LENGTH ALL_OF_MY_FILES NUM_FILES)

if (${NUM_FILES} GREATER_EQUAL 0)
	file(REMOVE_RECURSE ${ALL_OF_MY_FILES})
else()
	message("${NUM_FILES} files")
endif()

execute_process(
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/signalling-non-blocking-download.cmd https://link.testfile.org/500MB ${FIRST_UUID}
	WORKING_DIRECTORY "$ENV{USERPROFILE}\\Downloads")

execute_process(
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/signalling-non-blocking-download.cmd https://testfile.org/1.3GBiconpng ${SECOND_UUID}
	WORKING_DIRECTORY "$ENV{USERPROFILE}\\Downloads")

file(TO_CMAKE_PATH "$ENV{USERPROFILE}\\Downloads\\cmake-as-scripting" DIRECTORY_NORMALIZED)
message(${DIRECTORY_NORMALIZED})

file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false "${CMAKE_CURRENT_LIST_DIR}/temp/*.download_completed")
list(LENGTH ALL_OF_MY_FILES NUM_FILES)
message("${NUM_FILES}")

while(NOT ${NUM_FILES} EQUAL 2)
	file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false "${CMAKE_CURRENT_LIST_DIR}/temp/*.download_completed")
	list(LENGTH ALL_OF_MY_FILES NUM_FILES)
endwhile()

message("done ${NUM_FILES}")