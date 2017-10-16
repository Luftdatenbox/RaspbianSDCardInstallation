#!/bin/bash

source UserConfig.sh

echo $PASSWD_Name | sudo apt-get update
echo $PASSWD_Name | sudo apt-get upgrade -y

