Warning: Not for production use. Use this for research and testing.

# loggingstuff
This contains a .bat/batch script for disabling some Windows protections and enabling a bunch of logging. You'll want to test and disable some event ids or modify the script.

This will also download winlogbeat, the open source version. You have to configure the output on your own.

Run the .bat file with admin command prompt or copy and paste things as you need

Tested with IE VM - MSEdge Win10 x64 Stable 1809 virtual machine (https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)

I'm using Humio so winlogbeat.yml config I have here is specifically for it. In Humio, you do need to change default ingest-token parser to json (https://cloud.humio.com/sandbox/settings/ingest-tokens).

# packetbeat
loggingstuff_packetbeat.bat for installing and forwarding packetbeat logs.

humio_packetbeat.yml is the config that I modified and use with Humio

# openedr
loggingstuff_openedr.bat - dont use this. the way openedr logs is annoying to work with. see: https://github.com/ComodoSecurity/openedr/issues/14 (fixed now, just waiting for a new release)

# O365 / MS365
loggingstuff_o365.sh is for linux. yml file is for humio output

# Linux logs
loggingstuff_linux_logs.sh and humio_linux_log_filebeat.yml are for using filebeat to ship linux logs to humio. Data in humio will be unparsed and will just appear as lines.

I'm using snoopy to look at command line process. Auditbeat w/ system module would also work but OSS version doesnt have system module so i can't use it to ship data to Humio.

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

https://www.elastic.co/guide/en/beats/packetbeat/current/configuring-howto-packetbeat.html

https://www.openedr.com/

https://github.com/ComodoSecurity/openedr

https://www.humio.com/whats-new/blog/how-to-collect-microsoft-office-365-logs-with-o365beat

https://github.com/counteractive/o365beat

https://github.com/a2o/snoopy#what-is-snoopy
