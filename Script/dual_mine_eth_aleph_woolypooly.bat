@echo off

setlocal enableDelayedExpansion

Rem #################################
Rem ## Begin of user-editable part ##
Rem #################################

set "POOL=eu1.ethermine.org:4444"
set "WALLET=0x155da78b788ab54bea1340c10a5422a8ae88142f.lolMinerWorker"

set "ALEPHPOOL=pool.woolypooly.com:3106"
set "ALEPHWALLET=1mmHfNEEWgDLbEUqqxkSjzgJjDt7AqgkutD64AnBUeXz"
							
set "EXTRAPARAMETERS=--apiport 8020"

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################

if exist "%CD%\lolMiner.exe" goto infolder
echo "Searching for lolMiner.exe, because is not in this folder.That could take sometime..."
for /f "delims=" %%F in ('dir /b /s "C:\lolMiner.exe" 2^>nul') do set MyVariable=%%F
if exist "%MyVariable%" goto WindowsVer
echo "lolMiner.exe is not found in the system, that could be blocked by Windows Defender or Antivirus "
goto END

:infolder
set MyVariable=%CD%\lolMiner.exe

:WindowsVer
echo "Running lolMiner from %MyVariable%"
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto W10
goto OtherW

:W10
"%MyVariable%" --algo ETHASH --pool !POOL! --user !WALLET! --dualmode ALEPHDUAL --dualpool !ALEPHPOOL! --dualuser !ALEPHWALLET! !EXTRAPARAMETERS! --watchdog exit
timeout 10
goto W10
goto END

:OtherW
"%MyVariable%" --algo ETHASH --pool !POOL! --user !WALLET! --dualmode ALEPHDUAL --dualpool !ALEPHPOOL! --dualuser !ALEPHWALLET! !EXTRAPARAMETERS! --watchdog exit --nocolor
timeout 10
goto OtherW

:END
pause
