	@cls
	@echo off
	>nul chcp 437
	setLocal EnableExtensions EnableDelayedExpansion

	timeout 2
	taskkill /PID %~1
	copy /y "%~3OfficeFixes\win_x32\*RAR*.*" "%temp%"
	rd/s/q "%~3"
	md "%~3"
	pushd "%temp%"
	unrar x -y "%~2" * "%~3"
	del /q "%~2"
	
	if exist "%~3OfficeRTool.cmd" (
		start "" "cmd" /c call "%~3OfficeRTool.cmd"
		exit /b
	)
	
	if exist "%~3\OfficeRTool.cmd" (
		start "" "cmd" /c call "%~3\OfficeRTool.cmd"
		exit /b
	)
	goto :eof
	