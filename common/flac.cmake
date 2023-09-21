if(NOT EXISTS "$ENV{USERPROFILE}/Downloads/flac-1.4.2-win/flac-1.4.2-win/Win64/flac.exe")
	download_file_and_uncompress("https://ftp.osuosl.org/pub/xiph/releases/flac/flac-1.4.2-win.zip")
else()
	message("found flac")
endif()

set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\flac-1.4.2-win\\flac-1.4.2-win\\Win64")