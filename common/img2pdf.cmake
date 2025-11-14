include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()


if(NOT EXISTS "$ENV{SOFTWARE_DIR}/img2pdf.exe")
	download_file("https://gitlab.mister-muffin.de/josch/img2pdf/releases/download/0.6.0/img2pdf.exe")
else()
	message("found img2pdf")
endif()

# set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}")


