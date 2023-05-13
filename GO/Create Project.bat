@echo off
::初始化《go.mod》
go mod init mian
::创建《mian.go》
if not exist mian.go (
	echo package main > mian.go
	echo. >> mian.go
	echo import ( >> mian.go
	echo. >> mian.go
	echo ) >> mian.go
	echo. >> mian.go
	echo func main() { >> mian.go
	echo. >> mian.go
	echo } >> mian.go
)