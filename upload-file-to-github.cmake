# base64 somefile.txt | base64 -d - > 123.txt


# echo "{\"message\":\"my commit message\",\"committer\":{\"name\":\"Monalisa Octocat\",\"email\":\"octocat@github.com\"},\"content\":\"$(base64 ./20201014180756916.png)\"}" > temp.json

# D:\Softwares\PortableGit-2.35.1.2-64-bit\usr\bin\base64.exe


# "{\"owner\":\"dirkarnez\",\"name\":\"${NEW_REPO_NAME}\"}"

include(${CMAKE_CURRENT_SOURCE_DIR}/common/utils.cmake OPTIONAL RESULT_VARIABLE UTILS_IS_FOUND)
if (UTILS_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

message("File to upload")
input(FILE_TO_UPLOAD)
message(${FILE_TO_UPLOAD})

execute_process(COMMAND base64
  ${FILE_TO_UPLOAD}
  RESULT_VARIABLE FILE_TO_UPLOAD_BASE64
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

message(${FILE_TO_UPLOAD_BASE64})

# execute_process(COMMAND curl 
# "-L" 
# "-X" "PUT"
# "-H" "Accept: application/vnd.github+json"
# "-H" "Authorization: Bearer ${GIT_TOKEN}"
# "-H" "X-GitHub-Api-Version: 2022-11-28"
# "https://api.github.com/repos/dirkarnez/gittest/contents/20201014180756916.png"
# "-d"
# "@./temp.json"
# WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# execute_process(COMMAND rm 
# "./temp.json"
# WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})