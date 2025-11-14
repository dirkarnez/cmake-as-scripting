include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()


include(${CMAKE_CURRENT_LIST_DIR}/common/irfanview.cmake OPTIONAL RESULT_VARIABLE IFRANVIEW_IS_FOUND)
if (IFRANVIEW_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

# [IrfanView Command Line Options - ETCwiki](https://www.etcwiki.org/wiki/IrfanView_Command_Line_Options)

message("input_file")
input(input_file)
message("input_file ${input_file}")

message("output_file")
input(output_file)
message("output_file ${output_file}")

execute_process(
	COMMAND i_view64.exe ${input_file} /hflip /convert=${output_file}
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)
	
