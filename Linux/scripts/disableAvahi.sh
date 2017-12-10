#!/bin/bash


# disable avahi - mDNS
#echo $PASSWD_Name | sudo service avahi-daemon stop
#echo $PASSWD_Name | sudo service avahi-daemon disable
echo $PASSWD_Name | sudo systemctl stop avahi-daemon
echo $PASSWD_Name | sudo systemctl disable avahi-daemon
echo $PASSWD_Name | sudo systemctl daemon-reload
