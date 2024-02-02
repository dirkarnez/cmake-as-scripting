schtasks /create /tn mytask /tr "cmd /c 'start taskmgr && start schtasks /delete /tn mytask /f'" /sc once /st 20:17 /sd 06/05/2023
