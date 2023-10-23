function(input RETURN_VARIABLE)
	execute_process(
		COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/readinput.bat
		OUTPUT_VARIABLE TEMP
		WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		OUTPUT_STRIP_TRAILING_WHITESPACE)
    # string(STRIP ${TEMP} TEMP)
    SET(${RETURN_VARIABLE} ${TEMP} PARENT_SCOPE)
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

function(download_file_and_uncompress URL)
    get_filename_from_url(${URL} FILE_NAME_WITH_EXTENSION_TO_SAVE)

    set(DOWNLOAD_LOCATION $ENV{USERPROFILE}/Downloads/${FILE_NAME_WITH_EXTENSION_TO_SAVE})

    file(DOWNLOAD 
        ${URL}
        ${DOWNLOAD_LOCATION}
        INACTIVITY_TIMEOUT 5
        STATUS DOWNLOAD_STATUS_TUPLE)

    list(GET DOWNLOAD_STATUS_TUPLE 0 DOWNLOAD_STATUS)
	
    get_filename_component(FILE_NAME_WITHOUT_EXTENSION
        ${URL}
        NAME_WLE)
		
    if (DOWNLOAD_STATUS EQUAL 0)
        message("SUCCESS \"${FILE_NAME_WITH_EXTENSION_TO_SAVE}\"")
        file(ARCHIVE_EXTRACT 
            INPUT ${DOWNLOAD_LOCATION}
            DESTINATION $ENV{USERPROFILE}/Downloads/${FILE_NAME_WITHOUT_EXTENSION})
			
		file(REMOVE ${DOWNLOAD_LOCATION})
    else()
        message("NOT SUCCESS")
    endif()
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