include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/img2pdf.cmake OPTIONAL RESULT_VARIABLE IMG2PDF_IS_FOUND)
if (IMG2PDF_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

message("Directory")
input(DIRECTORY)
cmake_path(GET DIRECTORY STEM LAST_ONLY PDF_NAME)
message("${PDF_NAME}")
# file(TO_CMAKE_PATH "${DIRECTORY}" DIRECTORY)
# file(GLOB ALL_OF_MY_IMAGE_FILES LIST_DIRECTORIES false "${DIRECTORY}/*.jpg")
# list(SORT ALL_OF_MY_IMAGE_FILES COMPARE NATURAL ORDER ASCENDING)
# list(TRANSFORM ALL_OF_MY_IMAGE_FILES REPLACE "/" "\\\\")
# list(JOIN ALL_OF_MY_IMAGE_FILES " " ALL_OF_MY_IMAGE_FILES_JOINED)
# message("${ALL_OF_MY_IMAGE_FILES_JOINED}")

# execute_process(
# 	COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec-detached.bat 
# 	img2pdf.exe ${ALL_OF_MY_IMAGE_FILES_JOINED} -o "123.pdf" WORKING_DIRECTORY "${DIRECTORY}")
	
execute_process(
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec-detached.bat 
	img2pdf.exe "*.jpg" --ascending -o "${PDF_NAME}.pdf" WORKING_DIRECTORY "${DIRECTORY}")