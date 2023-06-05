schtasks /create /tn taskmgr /tr "cmd /c 'start taskmgr && start schtasks /delete /tn taskmgr /f'" /sc once /st 20:17 /sd 06/05/2023
