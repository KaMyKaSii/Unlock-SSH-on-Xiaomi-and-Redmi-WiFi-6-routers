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

reboot
