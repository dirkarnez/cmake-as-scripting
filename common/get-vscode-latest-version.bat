@echo off 
setlocal enableextensions 
for /f "tokens=*" %%a in ( 
'C:\Windows\System32\curl.exe -s "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"' 
) do ( 
set myvar=%%a 
) 

for /f "tokens=5 delims=/" %%i in ("%myvar%") do (
  set fileName=%%i
)

@REM C:\Windows\System32\curl.exe -s "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -L --output %fileName%
echo %fileName%
endlocal 
