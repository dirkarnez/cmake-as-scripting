@echo off
start "" cmd /c "C:\Windows\System32\curl %1 -L -O -J && echo > %~dp0\..\temp\%2.download_completed"
exit