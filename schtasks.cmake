schtasks /create /tn mytask /tr "cmd /c 'start taskmgr && start schtasks /delete /tn mytask /f'" /sc once /st 20:17 /sd 06/05/2023
@REM beep
schtasks /create /tn mytask /tr "cmd /c 'start rundll32 user32.dll,MessageBeep && start schtasks /delete /tn mytask /f'" /sc once /st 19:34 /sd 03/02/2024
