include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("%SOFTWARE_DIR%\\gs10051w64\\bin\\gswin64c.exe.exe -dSAFER -dBATCH -dNOPAUSE -dPDFSETTINGS=/ebook -sDEVICE=pdfwrite -dPreserveAnnots=false -sOutputFile=output.pdf input.pdf")

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/gs10051w64/bin/gswin64c.exe")
	download_file_and_uncompress("https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/gs10051w64.exe")
else()
	message("qpdf.exe exists")
endif()
