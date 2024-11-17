function(input RETURN_VARIABLE)
	execute_process(
		COMMAND ${CMAKE_CURRENT_LIST_DIR}/common/readinput.bat
		OUTPUT_VARIABLE TEMP
		WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
		OUTPUT_STRIP_TRAILING_WHITESPACE)
    # string(STRIP ${TEMP} TEMP)
    SET(${RETURN_VARIABLE} ${TEMP} PARENT_SCOPE)
endfunction()

function(pause_and_exit_error)
execute_process(
	COMMAND cmd /k "pause"
	WORKING_DIRECTORY "$ENV{USERPROFILE}")
    # string(STRIP ${TEMP} TEMP)
	message(FATAL_ERROR)
endfunction()

function(sleep)
    execute_process(
        COMMAND bash -c "sleep 5s")
endfunction()

function(get_filename_from_url URL RETURN_VARIABLE)
    get_filename_component(FILE_NAME_WITH_EXTENSION_TO_SAVE 
        ${URL}
        NAME)
    set(${RETURN_VARIABLE} ${FILE_NAME_WITH_EXTENSION_TO_SAVE} PARENT_SCOPE)
endfunction()

function(get_filename_from_url_without_extension URL RETURN_VARIABLE)
    get_filename_component(FILE_NAME_WITHOUT_EXTENSION
        ${URL}
        NAME_WLE)
    set(${RETURN_VARIABLE} ${FILE_NAME_WITHOUT_EXTENSION} PARENT_SCOPE)
endfunction()

function(download_file_and_uncompress)
    include("${CMAKE_CURRENT_SOURCE_DIR}/common/env.cmake" OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
    if (ENV_IS_FOUND STREQUAL "NOTFOUND")
        message(FATAL_ERROR "ENV_IS_FOUND: ${ENV_IS_FOUND}")
    endif()

	foreach(URL ${ARGV})
		get_filename_from_url(${URL} FILE_NAME_WITH_EXTENSION_TO_SAVE)
		
		message("Downloading ${FILE_NAME_WITH_EXTENSION_TO_SAVE}")
				
		execute_process(COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec.bat 
			curl ${URL}
			-L 
			-O
			-J
			WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
			RESULT_VARIABLE DOWNLOAD_STATUS)
		
		# file(DOWNLOAD ${URL} ${DOWNLOAD_LOCATION} INACTIVITY_TIMEOUT 10 STATUS DOWNLOAD_STATUS_TUPLE)

		# set(DOWNLOAD_LOCATION $ENV{USERPROFILE}/Downloads/${FILE_NAME_WITH_EXTENSION_TO_SAVE})
		
		# list(GET DOWNLOAD_STATUS_TUPLE 0 DOWNLOAD_STATUS)
		
		# get_filename_component(FILE_NAME_WITHOUT_EXTENSION ${URL} NAME_WLE)
			
		# if (DOWNLOAD_STATUS EQUAL 0)
		message("${FILE_NAME_WITH_EXTENSION_TO_SAVE} ${DOWNLOAD_STATUS}")
		#else()
		#	message("NOT SUCCESS ${FILE_NAME_WITH_EXTENSION_TO_SAVE}")
		# endif()
	endforeach()
	
	list(GET ARGV 0 FIRST_URL)
	
	get_filename_from_url(${FIRST_URL} FILE_NAME_WITH_EXTENSION_TO_SAVE)
	
	get_filename_component(FILE_NAME_WITHOUT_EXTENSION
			${FIRST_URL}
			NAME_WLE)

	execute_process(COMMAND C:\\PROGRA~1\\7-Zip\\7z.exe 
		x "$ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITH_EXTENSION_TO_SAVE}" -o${FILE_NAME_WITHOUT_EXTENSION} -y
		WORKING_DIRECTORY $ENV{SOFTWARE_DIR})
	
	# file(ARCHIVE_EXTRACT 
	#	INPUT $ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITH_EXTENSION_TO_SAVE}
	#	DESTINATION $ENV{USERPROFILE}\\Downloads\\${FILE_NAME_WITHOUT_EXTENSION})
		
	# file(REMOVE ${DOWNLOAD_LOCATION})
endfunction()

function(download_file_and_run URL)
    # get_filename_component(FILE_NAME_WITH_EXTENSION_TO_SAVE 
    #     ${URL}
    #     NAME)

    # get_filename_component(FILE_NAME_WITHOUT_EXTENSION
    #     ${URL}
    #     NAME_WLE)

    # set(DOWNLOAD_LOCATION $ENV{USERPROFILE}/Downloads/${FILE_NAME_WITH_EXTENSION_TO_SAVE})

    # file(DOWNLOAD 
    #     ${URL}
    #     ${DOWNLOAD_LOCATION}
    #     INACTIVITY_TIMEOUT 5
    #     STATUS DOWNLOAD_STATUS_TUPLE)

    execute_process(COMMAND curl ${URL}
        -L 
        -O
        -J
        WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
        RESULT_VARIABLE DOWNLOAD_STATUS)

    message("")

    # list(GET DOWNLOAD_STATUS_TUPLE 0 DOWNLOAD_STATUS)

    if ("${DOWNLOAD_STATUS}" EQUAL "0")
        message("SUCCESS!")
        # execute_process(
        #     COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
        #     "${DOWNLOAD_LOCATION}" 
        #     WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)
    else()
        message("NOT SUCCESS")
    endif()
endfunction()

function(download_file URL)
    # get_filename_component(FILE_NAME_WITH_EXTENSION_TO_SAVE 
    #     ${URL}
    #     NAME)

    # get_filename_component(FILE_NAME_WITHOUT_EXTENSION
    #     ${URL}
    #     NAME_WLE)

    # set(DOWNLOAD_LOCATION $ENV{USERPROFILE}/Downloads/${FILE_NAME_WITH_EXTENSION_TO_SAVE})

    # file(DOWNLOAD 
    #     ${URL}
    #     ${DOWNLOAD_LOCATION}
    #     INACTIVITY_TIMEOUT 5
    #     STATUS DOWNLOAD_STATUS_TUPLE)

    execute_process(COMMAND curl ${URL}
        -L 
        -O
        -J
        WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
        RESULT_VARIABLE DOWNLOAD_STATUS)

    message("")

    # list(GET DOWNLOAD_STATUS_TUPLE 0 DOWNLOAD_STATUS)

    if ("${DOWNLOAD_STATUS}" EQUAL "0")
        message("SUCCESS!")
        # execute_process(
        #     COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/exec-detached.bat 
        #     "${DOWNLOAD_LOCATION}" 
        #     WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads)
    else()
        message("NOT SUCCESS")
    endif()
endfunction()

function(find_exe EXECUTABLE_NAME)
    find_program(EXECUTABLE_FULL_PATH NAMES "${EXECUTABLE_NAME}" "${EXECUTABLE_NAME}.exe"
        PATHS $ENV{PATH}
    )

    if(EXECUTABLE_FULL_PATH)
      message(STATUS "${EXECUTABLE_NAME} found: ${EXECUTABLE_FULL_PATH}")
    else()
      message(WARNING "${EXECUTABLE_NAME} not found. Some functionality may be limited.")
      pause_and_exit_error()
    endif()
endfunction()
