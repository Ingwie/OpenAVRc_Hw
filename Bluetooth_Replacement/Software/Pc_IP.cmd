@echo off
setlocal enabledelayedexpansion

rem Recherche de l'adresse IPv4 active (hors 127.0.0.1)
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "IPv4"') do (
set ip=%%A
set ip=!ip:~1!
)

echo [NET] PC IP  : %ip%

endlocal
pause
