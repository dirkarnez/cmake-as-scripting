REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\PortableGit\usr\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
%DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;^
%PYTHON_DIR%;^
%PYTHON_DIR%\Scripts;^
P:\Downloads\ffmpeg-2021-10-28-git-e84c83ef98-full_build\bin;^
%SystemRoot%\System32;

@REM set PATH=^
@REM D:\Softwares\PortableGit-2.35.1.2-64-bit\bin;^
@REM D:\Softwares\x86_64-8.1.0-release-win32-posix-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-win32-posix-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.22.2-windows-x86_64\bin;^
@REM %SystemRoot%\System32;

cmake.exe -P %1
pause