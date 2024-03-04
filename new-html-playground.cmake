include("common/github.cmake" OPTIONAL RESULT_VARIABLE GITHUB_IS_FOUND)

if (GITHUB_IS_FOUND STREQUAL "NOTFOUND")
    message("???")
    # generate one
endif()

new_repo("tag-web-playground")
