	@cls
	@echo off
	>nul chcp 437
	setLocal EnableExtensions EnableDelayedExpansion
	
	rem Run as Admin with native shell, any path, params, loop guard, minimal i/o, by AveYo
	>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" & set "_= %*"
	>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" & start "%~n0" /high /min "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

	timeout 2
	taskkill /PID %~1
	copy /y "%~3OfficeFixes\win_x32\*RAR*.*" "%temp%"
	rd/s/q "%~3"
	md "%~3"
	pushd "%temp%"
	unrar x -y "%~2" * "%~3"
	del /q "%~2"
	
	start "" "cmd" /c call "%~3OfficeRTool.cmd"
	exit /b
	