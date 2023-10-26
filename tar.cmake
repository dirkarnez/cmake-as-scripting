include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("file")
input(file)

message(${file})

# Check tar location, Windows' built-in tar:
# tar -xf staticserver.zip  -C "123"
if(${file} MATCHES ".*.tar.gz$")
    # -z gzip
    execute_process(
        COMMAND  tar -zxvf ${file}
        WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
        OUTPUT_STRIP_TRAILING_WHITESPACE)
elseif(${file} MATCHES ".*.tar.bz2$")
    # -j bzip2
    execute_process(
        COMMAND  tar -jxvf ${file}
        WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
        OUTPUT_STRIP_TRAILING_WHITESPACE)
elseif(${file} MATCHES ".*.tar.xz$")
    execute_process(
        COMMAND  tar -xf ${file}
        WORKING_DIRECTORY $ENV{USERPROFILE}/Downloads
        OUTPUT_STRIP_TRAILING_WHITESPACE)
else() 
    message("Not support yet")
endif()
