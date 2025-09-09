include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/msys64/mingw64.exe")
	download_file("https://github.com/msys2/msys2-installer/releases/download/2025-08-30/msys2-base-x86_64-20250830.sfx.exe")
	message(".\msys2-x86_64-latest.exe in --confirm-command --accept-messages --root %cd%\msys64")
else()
	message("$ENV{SOFTWARE_DIR}/msys64/mingw64.exe exists")
endif()
