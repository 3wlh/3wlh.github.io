@ echo off & TITLE GO_Compile & CHCP 65001 & color 0d
Cls
@ echo. ======================================
@ echo.		环境变量
rem CGO状态 默认：0=关闭, 1=开启
SET CGO_ENABLED=0
echo. ======================================
rem 编译系统选择 GOOS=linux 默认linux ,Windows=windows,MAC=darwin
SET GOOS=linux
@ echo.	系统	= 	%GOOS%
@ echo. ======================================
rem 编译版本选择 GOARCH=amd64 默认64位=amd64 32位=386 , ARM 64位=arm64 32位=arm
SET GOARCH=arm
@ echo.	架构	=	%GOARCH%
rem 如果编译ARM 32位 选择架构 ，GOARM= 5 , 6 , 7
if "%GOARCH%" == "arm" (SET GOARM=7)
@ echo. ======================================
rem 压缩在命令后面添加：&& upx -9 main
@ echo. go build
if "%GOOS%" == "windows" (
go build -ldflags "-s -w" -gcflags "-N -l"  -o main.exe && upx -9 main.exe
)else (
go build -ldflags "-s -w" -gcflags "-N -l"  -o main && upx -9 main
)
@ echo.
@ echo.
@ echo.30秒后自动退出...
ping 127.1 -n 31 >nul
::@ echo.按任意键退出...
::pause >nul
exit
