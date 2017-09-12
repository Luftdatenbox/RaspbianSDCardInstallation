#!/bin/bash

source UserConfig.sh
source HostnameConfig.sh

## change Raspbery Pi's mDNS (local) address - in our example to "wetterstation"
echo $PASSWD_Name | sudo sed -i -e 's/'$OLD_HOSTNAME_Name'/'$HOSTNAME_Name'/g' /etc/hosts
echo $PASSWD_Name | sudo sed -i -e 's/'$OLD_HOSTNAME_Name'/'$HOSTNAME_Name'/g' /etc/hostname
echo $PASSWD_Name | sudo hostnamectl set-hostname --static $HOSTNAME_Name
#echo $PASSWD_Name | sudo /etc/init.d/hostname.sh
# changes are made after reboot


