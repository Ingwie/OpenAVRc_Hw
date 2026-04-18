@echo off
setlocal enabledelayedexpansion

rem === CONFIG ===
set ESP_IP=192.168.0.31
set PORT=3334

rem === Récupération IP ===
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "IPv4"') do (
set ip=%%A
set ip=!ip:~1!
)

echo [NET] PC IP  : %ip%

rem === Envoi TCP vers ESP32 ===
powershell -Command ^
"$client = New-Object System.Net.Sockets.TcpClient('%ESP_IP%', %PORT%); ^
$stream = $client.GetStream(); ^
$writer = New-Object System.IO.StreamWriter($stream); ^
$writer.WriteLine('IP %ip%'); ^
$writer.Flush(); ^
$client.Close()"

endlocal
pause
