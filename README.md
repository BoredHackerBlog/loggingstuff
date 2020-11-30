# loggingstuff
This contains a .bat/batch script for disabling some Windows protections and enabling a bunch of logging. You'll want to test and disable some event ids or modify the script.

This will also download winlogbeat, the open source version. You have to configure the output on your own.

Run the .bat file with admin command prompt or copy and paste things as you need

Tested with IE VM - MSEdge Win10 x64 Stable 1809 virtual machine (https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)

I'm using Humio so winlogbeat.yml config I have here is specifically for it. In Humio, you do need to change default ingest-token parser to json (https://cloud.humio.com/sandbox/settings/ingest-tokens).

# packetbeat
loggingstuff_packetbeat.bat for installing and forwarding packetbeat logs.

humio_packetbeat.yml is the config that I modified and use with Humio

# links from where i took commands and inspiration from
this course: https://www.blackhillsinfosec.com/training/applied-purple-teaming-training/

https://github.com/Cyb3rWard0g/HELK/

https://github.com/TonyPhipps/SIEM/blob/master/Lab/WindowsVictim.md

https://docs.humio.com/integrations/ingest-logs-with-a-data-shipper/beats/winlogbeat/

https://www.elastic.co/guide/en/beats/winlogbeat/current/winlogbeat-installation-configuration.html#installation

https://www.windows-commandline.com/start-stop-windows-update-service/

https://www.howtogeek.com/howto/windows-vista/enable-or-disable-uac-from-the-windows-vista-command-line/

https://www.windows-commandline.com/enable-remote-desktop-command-line/

https://pennprovenance.net/index.php?n=Tracker.Config

https://github.com/rkovar/PowerShell/blob/master/audit.bat

https://github.com/ctxis/CAPE/blob/master/conf/auxiliary.conf

# todo
Add OpenEDR (https://www.openedr.com/  https://github.com/ComodoSecurity/openedr) and filebeat?
