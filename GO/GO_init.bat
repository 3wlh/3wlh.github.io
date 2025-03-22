@ echo off & TITLE Create_Project & CHCP 65001
Cls
@ echo. ======================================
if not exist go.mod (
		echo.	初始化 ^<go.mod^>
		go mod init main
    ) else (
        echo.	更新 ^<go.mod^>
        go mod tidy
)
echo. ======================================
if not exist main.go (
		echo.	创建 ^<main.go^>
		echo package main> main.go
		echo.>> main.go
		echo import ^(>> main.go
		echo.>> main.go
		echo ^)>> main.go
		echo.>> main.go
		echo func main^(^) ^{>> main.go
		echo.>> main.go
		echo ^}>> main.go
)
@ echo.
@ echo.
@ echo.5秒后自动退出...
ping 127.1 -n 6 >nul
::@ echo.按任意键退出...
::pause >nul
exit