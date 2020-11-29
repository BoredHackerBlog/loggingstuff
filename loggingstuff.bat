echo creating C:\loggingsetup and moving to it
mkdir C:\loggingsetup
cd C:\loggingsetup

echo Stopping updates
sc config wuauserv start= disabled
net stop wuauserv

echo Disabling firewall
netsh advfirewall set allprofiles state off

echo Disabling Defender
powershell Set-MpPreference -DisableRealtimeMonitoring $true
powershell 'New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -PropertyType DWord -Value 1'

echo Disabling UAC
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

echo Enabling RDP
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

echo Enabling process and command line auditing
auditpol /Set /subcategory:"Process Creation" /Success:Enable
auditpol /Set /subcategory:"Process Termination" /Success:Enable
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit\ /v ProcessCreationIncludeCmdLine_Enabled /t REG_DWORD /d 1

echo Enabling powershell logging and transcript
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" /v EnableModuleLogging /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" /v * /t REG_SZ /d * /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockLogging /t REG_DWORD /d 00000001 /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableTranscripting /t REG_DWORD /d 00000001 /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v OutputDirectory /t REG_SZ /d C:\PSTranscipts /f /reg:64
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableInvocationHeader /t REG_DWORD /d 00000001 /f /reg:64

echo Enabling a bunch of auditing logs, success and failure
auditpol.exe /set /Category:* /success:enable
auditpol.exe /set /Category:* /failure:enable

echo Downloading and installing sysmon configs and sysmon.
powershell Invoke-WebRequest -Uri "https://raw.githubusercontent.com/olafhartong/sysmon-modular/master/sysmonconfig.xml" -OutFile "sysmonconfig.xml"
powershell Invoke-WebRequest -Uri "https://live.sysinternals.com/Sysmon.exe" -OutFile "sysmon.exe"
sysmon.exe -accepteula -i sysmonconfig.xml

echo Downloading winlogbeat
powershell Invoke-WebRequest -Uri "https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-oss-7.9.3-windows-x86_64.zip" -OutFile "winlogbeat.zip"
powershell Expand-Archive -Path winlogbeat.zip -DestinationPath C:\loggingsetup\winlogbeat\

echo Downloading HELKS winlogbeat configuration
powershell Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Cyb3rWard0g/HELK/master/configs/winlogbeat/winlogbeat.yml" -OutFile "winlogbeat.yml"

echo replacing default winlogbeat.yml
copy /y winlogbeat.yml winlogbeat\winlogbeat-7.9.3-windows-x86_64\winlogbeat.yml

echo 
echo
echo Modify C:\loggingsetup\winlogbeat\winlogbeat-7.9.3-windows-x86_64\winlogbeat.yml to fit your needs
echo
echo
echo
echo cd into C:\loggingsetup\winlogbeat\winlogbeat-7.9.3-windows-x86_64\
echo
echo
echo then run PowerShell.exe -ExecutionPolicy UnRestricted -File .\install-service-winlogbeat.ps1
echo
echo
echo finally run sc start winlogbeat
echo
echo
echo Reboot if you really want
echo
echo
