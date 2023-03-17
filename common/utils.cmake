function(input RETURN_VARIABLE)
    execute_process(
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/common/readinput
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
