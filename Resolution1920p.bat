@ECHO OFF
SET KeyPressCount=0

:: Open display settings
explorer ms-settings:display
ping -n 3 127.0.0.1 > nul

:VBSDynamicBuild
SET TempVBSFile=%tmp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"

:: Send 4 TABs
FOR /L %%i IN (1,1,4) DO (
    ECHO Sending Tab...
    ECHO WshShell.SendKeys "{TAB}" >>"%TempVBSFile%"
    SET /A KeyPressCount+=1
)

:: Send a SPACE
ECHO Sending Space...
ECHO WshShell.SendKeys " " >>"%TempVBSFile%"
SET /A KeyPressCount+=1

:: Send 16 additional TABs
FOR /L %%j IN (1,1,15) DO (
    ECHO Sending Tab...
    ECHO WshShell.SendKeys "{TAB}" >>"%TempVBSFile%"
    SET /A KeyPressCount+=1
    ECHO Wscript.Sleep 100 >>"%TempVBSFile%"
)

:: Send a SPACE
ECHO Sending Space...
ECHO WshShell.SendKeys " " >>"%TempVBSFile%"
SET /A KeyPressCount+=1
ECHO Wscript.Sleep 500 >>"%TempVBSFile%"


:: Send 2 DOWN arrow keys
FOR /L %%k IN (1,1,2) DO (
    ECHO Sending Down Key...
    ECHO WshShell.SendKeys "{DOWN}" >>"%TempVBSFile%"
    SET /A KeyPressCount+=1
    ECHO Wscript.Sleep 100 >>"%TempVBSFile%"
)

:: Send a SPACE
ECHO Sending Space...
ECHO WshShell.SendKeys " " >>"%TempVBSFile%"
SET /A KeyPressCount+=1
ECHO Wscript.Sleep 1000 >>"%TempVBSFile%"

:: Send TAB
ECHO Sending Tab...
ECHO WshShell.SendKeys "{TAB}" >>"%TempVBSFile%"
SET /A KeyPressCount+=1
ECHO Wscript.Sleep 100 >>"%TempVBSFile%"

:: Send a SPACE
ECHO Sending Space...
ECHO WshShell.SendKeys " " >>"%TempVBSFile%"
SET /A KeyPressCount+=1
ECHO Wscript.Sleep 500 >>"%TempVBSFile%"

:: Send ALT+F4 to close the settings window
ECHO Sending ALT+F4...
ECHO WshShell.SendKeys "%%{F4}" >>"%TempVBSFile%"
SET /A KeyPressCount+=1

:: Execute the VBS script
CSCRIPT //nologo "%TempVBSFile%"

:: Print the number of key presses
ECHO Total Key Presses: %KeyPressCount%

EXIT
