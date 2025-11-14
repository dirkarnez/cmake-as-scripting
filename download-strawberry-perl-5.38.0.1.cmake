include(${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/strawberry-perl-5.38.0.1-64bit-portable/portableshell.bat")
	download_file_and_uncompress("https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_5380_5361/strawberry-perl-5.38.0.1-64bit-portable.zip")
endif()