#!/bin/bash

source UserConfig.sh

# delete temporary user
echo $PASSWD_Name | sudo userdel tempuser
