REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\PortableGit\usr\bin;^
%DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;^
%DOWNLOADS_DIR%\curl-8.6.0_4-win64-mingw\curl-8.6.0_4-win64-mingw\bin;

@REM set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable
@REM %DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
@REM %DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
@REM %DOWNLOADS_DIR%\ffmpeg-master-latest-win64-gpl-shared\bin;^
@REM %DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;^
@REM %DOWNLOADS_DIR%\node-v18.17.1-win-x64;^
@REM %PYTHON_DIR%;^
@REM %PYTHON_DIR%\Scripts;


cmake.exe -P %1 || pause