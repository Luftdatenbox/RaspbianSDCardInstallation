#!/bin/bash

##  unattended update - only security updates
# reference https://blog.dantup.com/2016/04/setting-up-automatic-updates-on-raspberry-pi-raspbian-jessie/
sudo apt-get install unattended-upgrades -y
# possible with interaction
# sudo dpkg-reconfigure -plow unattended-upgrades
# select and press enter
# can be tested via: sudo unattended-upgrades --dry-run and checked: tail /var/log/unattended-upgrades/unattended-upgrades.log
# automatically:
echo "APT::Periodic::Update-Package-Lists \"1\";
APT::Periodic::Unattended-Upgrade \"1\";" | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades
sudo unattended-upgrades --dry-run
