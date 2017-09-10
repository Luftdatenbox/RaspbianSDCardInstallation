#!/bin/bash

source reconfigureUserConfig.sh

#change password
echo $OLD_PASSWD_Name | sudo -S echo -e "$PASSWD_Name\n$PASSWD_Name" | sudo passwd $USER_Name
