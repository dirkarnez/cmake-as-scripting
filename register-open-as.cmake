execute_process(
	COMMAND C:\\Windows\\System32\\whoami.exe
	OUTPUT_VARIABLE CURRENT_USER
	WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
	OUTPUT_STRIP_TRAILING_WHITESPACE)


if("${CURRENT_USER}" STREQUAL "administrator\\administrator")
	string(REPLACE "\\" "\\\\" CMAKE_CMAKE_PATH "D:\\Softwares\\cmake-3.29.3-windows-x86_64\\bin\\cmake.exe")
	string(REPLACE "\\" "\\\\" CMAKE_CMAKE_GUI_PATH "D:\\Softwares\\cmake-3.29.3-windows-x86_64\\bin\\cmake-gui.exe")
else()
	string(REPLACE "\\" "\\\\" CMAKE_CMAKE_PATH "$ENV{USERPROFILE}\\Downloads\\cmake-3.26.1-windows-x86_64\\bin\\cmake.exe")
	string(REPLACE "\\" "\\\\" CMAKE_CMAKE_GUI_PATH "$ENV{USERPROFILE}\\Downloads\\cmake-3.26.1-windows-x86_64\\bin\\cmake-gui.exe")
endif()


configure_file("${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg.in" "${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg" @ONLY)

execute_process(
	COMMAND C:\\Windows\\System32\\reg.exe import open-as.reg
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/common"
)

# file(REMOVE "${CMAKE_CURRENT_SOURCE_DIR}/common/open-as.reg")

execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec.bat
	C:\\Windows\\System32\\taskkill.exe /f /im explorer.exe
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/common"
)

execute_process(
	COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat
	explorer.exe
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/common"
)