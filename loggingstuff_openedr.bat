echo Downloading OpenEDR
powershell Invoke-WebRequest -Uri "https://github.com/ComodoSecurity/openedr/releases/download/2.0.0.0/OpenEDR-installation-2.0.0.0-x64.msi" -OutFile "openedr.msi"

openedr.msi /qn /norestart

echo creating C:\loggingsetup and moving to it
mkdir C:\loggingsetup
cd C:\loggingsetup

echo Downloading filebeat
powershell Invoke-WebRequest -Uri "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-oss-7.10.0-windows-x86_64.zip" -OutFile "filebeat.zip"
powershell Expand-Archive -Path filebeat.zip -DestinationPath C:\loggingsetup\filebeat\

