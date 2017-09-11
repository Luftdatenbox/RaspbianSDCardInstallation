#!/bin/bash

# create temporary user - tempuser
echo $PASSWD_Name | sudo useradd -m tempuser
echo $PASSWD_Name | sudo -S echo -e "tempuserpwd\ntempuserpwd" | sudo passwd tempuser
#echo $PASSWD_Name | sudo passwd tempuser
echo $PASSWD_Name | sudo usermod -a -G sudo tempuser


