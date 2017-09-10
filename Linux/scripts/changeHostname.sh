#!/bin/bash


## change Raspbery Pi's mDNS (local) address - in our example to "wetterstation"
sudo sed -i -e 's/raspberrypi/wetterstation/g' /etc/hosts
sudo sed -i -e 's/raspberrypi/wetterstation/g' /etc/hostname
sudo /etc/init.d/hostname.sh
# changes are made after reboot
sudo reboot
# from now in login via ~$ ssh pi@wetterstation.local
