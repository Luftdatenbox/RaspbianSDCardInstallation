#!/bin/bash

source UserConfig.sh
source StaticIpConfig.sh

# set up static ip
echo $PASSWD_Name | sudo mkdir -p /etc/systemd/network/
echo $PASSWD_Name | sudo touch /etc/systemd/network/eth0.network

echo "
[Match]
Name=eth0

[Network]
Description=eth0 static ip
Address=$STATIC_IP_ADDRESS
Gateway=$STATIC_GATEWAY
DNS=$STATIC_DNS
" | sudo tee --append /etc/systemd/network/eth0.network


# deactivating dhcp
echo $PASSWD_Name | sudo systemctl stop dhcpcd
echo $PASSWD_Name | sudo systemctl disable dhcpcd

# stop old network services
echo $PASSWD_Name | sudo systemctl disable networking
echo $PASSWD_Name | sudo systemctl disable NetworkManager
echo $PASSWD_Name | sudo systemctl daemon-reload

# enable systemd network services
echo $PASSWD_Name | sudo systemctl enable systemd-networkd.service
echo $PASSWD_Name | sudo systemctl start systemd-networkd.service
#echo $PASSWD_Name | sudo systemctl daemon-reload

# restart interface
#(echo $PASSWD_Name | sudo ifconfig eth0 down) & (echo $PASSWD_Name | sudo ifconfig eth0 up)


