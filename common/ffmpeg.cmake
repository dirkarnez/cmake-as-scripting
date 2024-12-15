if(NOT EXISTS "$ENV{SOFTWARE_DIR}/ffmpeg-6.0-full_build-shared/ffmpeg-6.0-full_build-shared/bin/ffmpeg.exe")
	message("downloading ffmpeg")
	download_file_and_uncompress("https://github.com/GyanD/codexffmpeg/releases/download/6.0/ffmpeg-6.0-full_build-shared.zip")
else()
	message("found ffmpeg")
endif()

set(ENV{PATH} "$ENV{PATH};$ENV{SOFTWARE_DIR}\\ffmpeg-6.0-full_build-shared\\ffmpeg-6.0-full_build-shared\\bin")