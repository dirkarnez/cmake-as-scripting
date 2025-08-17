include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("Password")
input(PASSWORD)
string(LENGTH "${PASSWORD}" PASSWORD_LENGTH)
message("PASSWORD: ${PASSWORD} PASSWORD_LENGTH: ${PASSWORD_LENGTH}")

message("Directory")
input(DIRECTORY)

file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY_NORMALIZED)
message(${DIRECTORY_NORMALIZED})

file(GLOB ALL_OF_MY_FILES LIST_DIRECTORIES false ${DIRECTORY_NORMALIZED}/*)

foreach(file ${ALL_OF_MY_FILES})
	get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${file} NAME_WLE)
	
	if(${PASSWORD_LENGTH} LESS_EQUAL 0)
		execute_process(
			COMMAND "C:/Program Files/7-Zip/7z.exe" "a" "${FILE_NAME_WITHOUT_EXTENSION}.zip" "${file}"
			WORKING_DIRECTORY ${DIRECTORY_NORMALIZED}
			OUTPUT_STRIP_TRAILING_WHITESPACE)
	else()
		execute_process(
			COMMAND "C:/Program Files/7-Zip/7z.exe" "a" "${FILE_NAME_WITHOUT_EXTENSION}.zip" "${file}" "-p${PASSWORD}"
			WORKING_DIRECTORY ${DIRECTORY_NORMALIZED}
			OUTPUT_STRIP_TRAILING_WHITESPACE)
	endif()
endforeach()




