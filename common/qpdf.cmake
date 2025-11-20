include(${CMAKE_CURRENT_LIST_DIR}/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\qpdf-11.10.0-mingw64\\qpdf-11.10.0-mingw64\\bin")
