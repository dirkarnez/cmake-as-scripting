include(${CMAKE_CURRENT_LIST_DIR}/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/iview472_x64/i_view64.exe")
	message("downloading IrfanView")
	download_file_and_uncompress("https://www.irfanview.info/files/iview472_x64.zip")
else()
	message("found IrfanView")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\iview472_x64")