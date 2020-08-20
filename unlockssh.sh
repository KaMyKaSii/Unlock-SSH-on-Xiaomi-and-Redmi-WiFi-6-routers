#!/bin/sh

nvram set ssh_en=1
nvram set uart_en=1
nvram set boot_wait=on
nvram commit
cp /etc/init.d/dropbear /etc/init.d/dropbear_backup
sed -i '/flg_ssh.*release/ { :a; N; /fi/! ba };/return 0/d' /etc/init.d/dropbear
echo -e "password\npassword" | passwd root
/etc/init.d/dropbear enable
/etc/init.d/dropbear start

cat << 'EOF' >> /etc/hosts

::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

0.0.0.0 baidu.com taobao.com xiaomi.cn xiaomi.com
0.0.0.0 www.baidu.com www.taobao.com www.xiaomi.cn www.xiaomi.com
::1     baidu.com taobao.com xiaomi.cn xiaomi.com
::1     www.baidu.com www.taobao.com www.xiaomi.cn www.xiaomi.com
0.0.0.0 miwifi.com log.miwifi.com s.miwifi.com app.miwifi.com stun.miwifi.com broker.miwifi.com
::1     miwifi.com log.miwifi.com s.miwifi.com app.miwifi.com stun.miwifi.com broker.miwifi.com
0.0.0.0 bbs.xiaomi.cn bbs.xiaomi.com
::1     bbs.xiaomi.cn bbs.xiaomi.com
EOF

reboot
# http://192.168.31.1/cgi-bin/luci/;stok=<STOK>/api/misystem/set_config_iotdev?bssid=gallifrey&user_id=doctor&ssid=-h%0Acurl%20--insecure%20https%3A%2F%2Fdev.melmac.net%2Fax3600.sh%20%7C%20ash%0A
# /api/misystem/set_config_iotdev?bssid=gallifrey&user_id=doctor&ssid=-h%0Acurl%20--insecure%20https%3A%2F%2Fgithub.com%2FKaMyKaSii%2FUnlock-SSH-on-Xiaomi-and-Redmi-WiFi-6-routers%2Fraw%2Fmaster%2Funlockssh.sh%20%7C%20ash%0A
