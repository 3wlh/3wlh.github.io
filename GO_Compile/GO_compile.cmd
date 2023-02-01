@ ECHO OFF & TITLE 3wking & CHCP 65001 
rem mode con cols=35 lines=30
color 0d
:Menu
Cls
@ echo.==================================
@ echo. 【把脚本放入源码文件夹的目录下】
@ echo.==================================
@ echo. 【安装Golang】【根据系统选择】
@ echo.==================================
@ echo.      [liunx64]  → 请输入1
@ echo.==================================
@ echo.      [liunx32]  → 请输入2
@ echo.==================================
@ echo.      [x86_64]  →  请输入3
@ echo.==================================
@ echo.      [x86_32]  →  请输入4
@ echo.==================================
@ echo.      [mac_64]  →  请输入5
@ echo.==================================
@ echo.      [mac_32]  →  请输入6
@ echo.==================================
set /p xj= 输入数字按回车：
if /i "%xj%"=="1" Goto liunx_x64
if /i "%xj%"=="2" Goto liunx_X32
if /i "%xj%"=="3" Goto x86_X64
if /i "%xj%"=="4" Goto x86_X32
if /i "%xj%"=="5" Goto mac_X64
if /i "%xj%"=="6" Goto mac_X32
@ echo.
echo      选择无效，请重新输入
ping -n 2 127.1 >nul
goto menu
========================================================================
:liunx_X64
@ echo.
SET CGO_ENABLED=0&& SET GOOS=linux&& SET GOARCH=amd64&& go build
@ echo.
@ echo.
@ echo.======================
@ echo.=  无报错为编译完成  =
@ echo.======================
@ echo.
@ echo.任意键返回主菜单... & pause >nul
goto Menu
========================================================================
:liunx_X32
@ echo.
SET CGO_ENABLED=0&& SET GOOS=linux&& SET GOARCH=368&& go build
@ echo.
@ echo.
@ echo.======================
@ echo.=  无报错为编译完成  =
@ echo.======================
@ echo.
@ echo.任意键返回主菜单... & pause >nul
goto Menu
=========================================================================
:x86_X64
@ echo.
SET CGO_ENABLED=0&& SET GOOS=windows&& SET GOARCH=amd64&& go build -ldflags="-w -s"
@ echo.
@ echo.
@ echo.======================
@ echo.=  无报错为编译完成  =
@ echo.======================
@ echo.
@ echo.任意键返回主菜单... & pause >nul
goto Menu
=========================================================================
:x86_X32
@ echo.
SET CGO_ENABLED=0&& SET GOOS=windows&& SET GOARCH=368&& go build -ldflags="-w -s"
@ echo.
@ echo.
@ echo.======================
@ echo.=  无报错为编译完成  =
@ echo.======================
@ echo.
@ echo.任意键返回主菜单... & pause >nul
goto Menu
--------------------------------
:mac_X64
@ echo.
SET CGO_ENABLED=0&& SET GOOS=darwin&& SET GOARCH=amd64&& go build -ldflags="-w -s"
@ echo.
@ echo.
@ echo.======================
@ echo.=  无报错为编译完成  =
@ echo.======================
@ echo.
@ echo.任意键返回主菜单... & pause >nul
goto Menu
-------------------------------------------
:mac_X32
@ echo.
SET CGO_ENABLED=0&& SET GOOS=darwin&& SET GOARCH=368&& go build -ldflags="-w -s"
@ echo.
@ echo.
@ echo.======================
@ echo.=  无报错为编译完成  =
@ echo.======================
@ echo.
@ echo.任意键返回主菜单... & pause >nul
goto Menu
--------------------------------------------
