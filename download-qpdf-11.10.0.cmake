include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("%SOFTWARE_DIR%\\qpdf-11.10.0-mingw64\\bin\\qpdf.exe --decrypt --password=\"Original Password\" input.pdf output.pdf")
message("%SOFTWARE_DIR%\\qpdf-11.10.0-mingw64\\bin\\qpdf.exe --linearize input.pdf output.pdf")

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/qpdf-11.10.0-mingw64/bin/qpdf.exe")
	download_file_and_uncompress("https://github.com/qpdf/qpdf/releases/download/v11.10.0/qpdf-11.10.0-mingw64.zip")
else()
	message("qpdf.exe exists")
endif()
