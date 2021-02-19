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
#Try to preserve modified dropbear file on upgrade
echo "/etc/init.d/dropbear" >> /etc/sysupgrade.conf

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
