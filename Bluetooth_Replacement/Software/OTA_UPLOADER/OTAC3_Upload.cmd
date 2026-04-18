@echo off

set ESP_IP=192.168.0.40
set HOST_IP=192.168.0.21
set OTA_PORT=3232
set OTA_PASS=oavrc

if "%~1"=="" (
    echo Drag and drop your .ino.bin file onto this script.
    pause
    exit /b
)

set "BIN_FILE=%~1"

echo.
echo === OTA Upload to %ESP_IP% ===
echo File: %BIN_FILE%
echo.

"espota.exe" ^
-i %ESP_IP% ^
-p %OTA_PORT% ^
--auth=%OTA_PASS% ^
--host_ip=%HOST_IP% ^
-f "%BIN_FILE%" ^
-d

pause
