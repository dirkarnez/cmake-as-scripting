include(${CMAKE_CURRENT_LIST_DIR}/common/ffmpeg.cmake OPTIONAL RESULT_VARIABLE FFMPEG_IS_FOUND)
if (FFMPEG_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{SOFTWARE_DIR}/yt-dlp_win/yt-dlp.exe")
	message("downloading yt-dlp")
	download_file_and_uncompress("https://github.com/yt-dlp/yt-dlp/releases/download/2025.10.22/yt-dlp_win.zip")
else()
	message("found yt-dlp")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\yt-dlp_win")