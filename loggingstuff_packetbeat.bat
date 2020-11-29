echo creating C:\loggingsetup and moving to it
mkdir C:\loggingsetup
cd C:\loggingsetup

echo Downloading packetbeat
powershell Invoke-WebRequest -Uri "https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-oss-7.10.0-windows-x86_64.zip" -OutFile "packetbeat.zip"
powershell Expand-Archive -Path packetbeat.zip -DestinationPath C:\loggingsetup\packetbeat\

echo install npcap manually through GUI
powershell Invoke-WebRequest -Uri "https://nmap.org/npcap/dist/npcap-1.00.exe" -OutFile "npcap.exe"
npcap.exe
pause

echo
echo
echo Modify C:\loggingsetup\packetbeat\packetbeat-7.10.0-windows-x86_64\packetbeat.yml
echo
echo
echo
echo cd into C:\loggingsetup\packetbeat\packetbeat-7.10.0-windows-x86_64\
echo
echo
echo then run PowerShell.exe -ExecutionPolicy UnRestricted -File .\install-service-packetbeat.ps1
echo
echo
echo finally run sc start packetbeat
echo
echo
echo Reboot if you really want
echo
echo
