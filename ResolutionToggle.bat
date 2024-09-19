@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:: Initialize counter
SET counter=0

:: Get resolutions of all video controllers
FOR /F "usebackq tokens=1" %%A IN (`wmic path Win32_VideoController get CurrentHorizontalResolution ^| findstr /R "^[0-9]"`) DO (
    SET /A counter+=1
    SET Resolution[!counter!]=%%A
)

:: Output resolutions for debugging
ECHO Resolutions:
FOR /L %%i IN (1,1,!counter!) DO (
    ECHO Monitor %%i: !Resolution[%%i]!
)

:: Check the resolution of the second monitor
IF "!Resolution[1]!"=="1920" (
    ECHO First monitor is 1920p. Switching to 4K...
    CALL Resolution4K.bat
) ELSE (
    ECHO First monitor is 4K. Switching to 1920p...
    CALL Resolution1920p.bat
)

:: Pause to keep the console open
PAUSE
 	 
EXIT /B
					 