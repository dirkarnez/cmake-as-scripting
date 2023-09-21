include(${CMAKE_CURRENT_SOURCE_DIR}/common/ffmpeg.cmake OPTIONAL RESULT_VARIABLE FFMPEG_IS_FOUND)
if (FFMPEG_IS_FOUND STREQUAL "NOTFOUND")
	message("???")
	# generate one
endif()

if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/yt-dlp_win/yt-dlp.exe")
	message("downloading yt-dlp")
	download_file_and_uncompress("https://github.com/yt-dlp/yt-dlp/releases/download/2023.07.06/yt-dlp_win.zip")
else()
	message("found yt-dlp")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{USERPROFILE}\\Downloads\\yt-dlp_win")