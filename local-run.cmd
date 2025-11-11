REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%


for /f "tokens=*" %%a in ('C:\Windows\System32\whoami.exe') do (
    set output=%%a
)

if "%output%" == "administrator\administrator" (
echo User is an administrator

set PATH=^
D:\Softwares\PortableGit\bin;^
D:\Softwares\PortableGit\usr\bin;^
D:\Softwares\cmake-3.29.3-windows-x86_64\bin;^
D:\Softwares\curl-8.7.1_9-win64-mingw\bin;

) else (

echo User is not an administrator

set PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\PortableGit\usr\bin;^
%DOWNLOADS_DIR%\cmake-3.29.3-windows-x86_64\cmake-3.29.3-windows-x86_64\bin;^
%DOWNLOADS_DIR%\curl-8.6.0_4-win64-mingw\curl-8.6.0_4-win64-mingw\bin;

)

cmake.exe -P %1 || pause
