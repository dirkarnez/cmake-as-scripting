start "" /B "%USERPROFILE%\Downloads\ffmpeg-6.0-full_build-shared\ffmpeg-6.0-full_build-shared\bin\ffmpeg.exe" -f gdigrab -framerate 30 -i desktop -c:v libx264 output.mp4
# https://trac.ffmpeg.org/wiki/Capture/Desktop
