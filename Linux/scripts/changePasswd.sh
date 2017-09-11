#!/bin/bash

source UserConfig.sh

#change password
echo $OLD_PASSWD_Name | sudo -S echo -e "$PASSWD_Name\n$PASSWD_Name" | sudo passwd $OLD_USER_Name
