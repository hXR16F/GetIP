:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off

if /i "%1" equ "--external" (
	if not exist "wget.exe" (
		echo Missing: WGET & echo Download: 'http://gnuwin32.sourceforge.net/packages/wget.htm'. & exit /B
	)
	setlocal EnableDelayedExpansion
	call wget.exe -q -O "%temp%\ext_ip" "http://api.ipify.org/"
	if exist "%temp%\ext_ip" (
		for /f "delims=" %%a in (%temp%\ext_ip) do (
			set "ext_ip=%%a"
		)
		echo;| set /p "%random%=!ext_ip!" > ext_ip.var
	) else (
		echo Error. & endlocal & exit /B
	)
	endlocal
	if exist "%temp%\ext_ip" del /f /q %temp%\ext_ip > nul
	exit /B
) else (
	if /i "%1" equ "--internal" (
		setlocal EnableDelayedExpansion
		ipconfig | findstr /C:"IPv4 Address. . . . . . . . . . . :" > %temp%\int_ip
		for /f "tokens=2* delims=:" %%a in (%temp%\int_ip) do (
			set "tempint=%%a"
			set "int_ip=!tempint:~1,15!"
		)
		echo;| set /p "%random%=!int_ip!" > int_ip.var
		if exist "%temp%\int_ip" del /f /q %temp%\int_ip > nul
		endlocal
		exit /B
	) else (
		if /i "%1" equ "--clean" (
			if exist "%temp%\ext_ip" del /f /q %temp%\ext_ip > nul
			if exist "%temp%\int_ip" del /f /q %temp%\int_ip > nul
			if exist "ext_ip.var" del /f /q "ext_ip.var" > nul
			if exist "int_ip.var" del /f /q "int_ip.var" > nul
		) else (
			exit /B
		)
	)
)
