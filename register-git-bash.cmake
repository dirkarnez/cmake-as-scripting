string(REPLACE "\\" "\\\\" CMAKE_USERPROFILE "$ENV{USERPROFILE}")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/common/sh-open-as-git-bash.reg.in" "${CMAKE_CURRENT_SOURCE_DIR}/common/sh-open-as-git-bash.reg" @ONLY)

execute_process(
	COMMAND reg import sh-open-as-git-bash.reg
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/common"
)

file(REMOVE "${CMAKE_CURRENT_SOURCE_DIR}/common/sh-open-as-git-bash.reg")

execute_process(
	COMMAND taskkill /f /im explorer.exe
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/common"
)
	
execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat
	explorer.exe
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/common"
)
