execute_process(
	COMMAND git config --global credential.helper WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
execute_process(
	COMMAND git config --global user.name "dirkarnez" WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
execute_process(
	COMMAND git config --global user.email "smalldirkalex@gmail.com" WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})