include(${CMAKE_CURRENT_LIST_DIR}/env.cmake OPTIONAL RESULT_VARIABLE ENV_IS_FOUND)
if (ENV_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/ffmpeg-6.0-full_build-shared/ffmpeg-6.0-full_build-shared/bin/ffmpeg.exe")
	message("downloading ffmpeg")
	download_file_and_uncompress("https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-full_build-shared.zip")
else()
	message("found ffmpeg")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\ffmpeg-6.0-full_build-shared\\ffmpeg-6.0-full_build-shared\\bin")