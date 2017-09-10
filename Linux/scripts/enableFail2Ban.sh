#!/bin/bash

# http://kamilslab.com/2016/12/11/how-to-install-fail2ban-on-the-raspberry-pi/
sudo apt install fail2ban -y

# create jail.local for ssh to counter brute force attacks 
echo "[ssh] 
 
enabled = true 
# port = ssh 
# we do not use the standard ssh port any more
port = 8022
filter = sshd 
logpath = /var/log/auth.log 
bantime = 900 
banaction = iptables-allports 
findtime = 900 
maxretry = 5 
" | sudo tee -a /etc/fail2ban/jail.local
# restart fail2ban
sudo service fail2ban restart

# interessting commands:
# sudo tail -f /var/log/fail2ban.log
# sudo cat /var/log/auth.log | more
# sudo iptables -L -n --line


