#!/bin/bash

source UserConfig.sh

# http://kamilslab.com/2016/12/11/how-to-install-fail2ban-on-the-raspberry-pi/
echo $PASSWD_Name | sudo apt install fail2ban -y

# create jail.local for ssh to counter brute force attacks 
echo "[ssh] 
 
enabled = true 
# port = ssh 
port = 22
filter = sshd 
logpath = /var/log/auth.log 
bantime = 900 
banaction = iptables-allports 
findtime = 900 
maxretry = 5 
" | sudo tee --append /etc/fail2ban/jail.local
# restart fail2ban
echo $PASSWD_Name | sudo service fail2ban restart

# interessting commands:
# sudo tail -f /var/log/fail2ban.log
# sudo cat /var/log/auth.log | more
# sudo iptables -L -n --line


