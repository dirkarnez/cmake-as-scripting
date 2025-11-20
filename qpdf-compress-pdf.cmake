include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
  message("UTILS_IS_FOUND: ${UTILS_IS_FOUND}")
  # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/qpdf.cmake OPTIONAL RESULT_VARIABLE QPDF_IS_FOUND)
if (QPDF_IS_FOUND STREQUAL "NOTFOUND")
	message("QPDF_IS_FOUND: ${QPDF_IS_FOUND}")
	# generate one
endif()

message("input file (.pdf)")
input(INPUT_FILE)
message("${INPUT_FILE}")

execute_process(
	COMMAND qpdf --compress-streams=y --object-streams=generate --optimize-images --compression-level=9 "${INPUT_FILE}" output.pdf
	WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
	OUTPUT_STRIP_TRAILING_WHITESPACE)
