wget "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-oss-7.10.1-linux-x86_64.tar.gz"
tar xvfs filebeat-oss-7.10.1-linux-x86_64.tar.gz
cd filebeat-7.10.1-linux-x86_64/
echo edit filebeat.yml
echo run ./filebeat test config filebeat.yml  to test your config file
echo run ./filebeat test output filebeat.yml  to test output
echo run ./filebeat -c filebeat.yml to start shipping logs
