include(${CMAKE_CURRENT_LIST_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("utils.cmake not available")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/secrets.cmake OPTIONAL RESULT_VARIABLE SECRETS_IS_FOUND)
if (SECRETS_IS_FOUND STREQUAL "NOTFOUND")
    message("secrets.cmake not available")
    pause_and_exit_error()
endif()

include(${CMAKE_CURRENT_LIST_DIR}/common/env.cmake)

find_exe("git")

message("Existing repository **URL**:")
input(URL)
message("${URL}")

execute_process(
	COMMAND git config --global credential.helper ""
	WORKING_DIRECTORY "$ENV{USERPROFILE}")
	
execute_process(
	COMMAND git 
	clone
	"${URL}"
	WORKING_DIRECTORY "$ENV{USERPROFILE}/Downloads")

include(${CMAKE_CURRENT_LIST_DIR}/download-vscodium.cmake OPTIONAL RESULT_VARIABLE VSCODIUM_IS_FOUND)
if (VSCODIUM_IS_FOUND STREQUAL "NOTFOUND")
	message(FATAL_ERROR "VSCODIUM_IS_FOUND: ${VSCODIUM_IS_FOUND}")
endif()
	
execute_process(
	COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/exec-detached.bat 
	${VSCODE}
)