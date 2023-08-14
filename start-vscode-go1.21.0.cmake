set(DOWNLOADS_DIR "$ENV{USERPROFILE}\\Downloads")
set(ENV{GOROOT} "${DOWNLOADS_DIR}\\go1.21.0.windows-amd64\\go")
set(ENV{GOPATH} "P:\\Downloads\\gopath")

set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}")
set(ENV{PATH} "$ENV{PATH};${GOROOT}\\bin")
set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\PortableGit\\bin")
set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0")
set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\\bin")
set(ENV{PATH} "$ENV{PATH};${DOWNLOADS_DIR}\\cmake-3.22.2-windows-x86_64\\bin")

message("${DOWNLOADS_DIR}")
message("$ENV{GOROOT}")
message("$ENV{PATH}")
message("$ENV{VSCODE_EXTENSION_PATH}")
message("$ENV{VSCODE_USER_DATA_PATH}")

execute_process(
	COMMAND "${DOWNLOADS_DIR}\\VSCode-win32-x64-1.66.1\\Code.exe" --extensions-dir "$ENV{VSCODE_EXTENSION_PATH}" --user-data-dir "$ENV{VSCODE_USER_DATA_PATH}"
	WORKING_DIRECTORY ${DOWNLOADS_DIR})