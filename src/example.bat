@echo off

call getip.bat --external
echo;| set /p ".=Your external IP address is: " & type ext_ip.var & echo.

call getip.bat --internal
echo;| set /p ".=Your internal IP address is: " & type int_ip.var & echo.

call getip.bat --clean
pause