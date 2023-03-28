REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
%DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;^
%DOWNLOADS_DIR%\flac-1.4.2-win\Win64;^
%SystemRoot%\System32;

@REM set PATH=^
@REM D:\Softwares\PortableGit-2.35.1.2-64-bit\bin;^
@REM D:\Softwares\x86_64-8.1.0-release-win32-posix-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-win32-posix-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.22.2-windows-x86_64\bin;^
@REM D:\Softwares\flac-1.4.2-win\Win64;^
@REM %SystemRoot%\System32;

cmake.exe -P %1
pause