@echo off
setlocal enabledelayedexpansion

rem === CONFIG ===
set PORT=COM5
set BAUD=115200

rem === Récupération IP ===
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "IPv4"') do (
set ip=%%A
set ip=!ip:~1!
)

echo [NET] PC IP  : %ip%

rem === Envoi vers ESP32 ===
echo IP %ip% > %PORT%

endlocal
pause
