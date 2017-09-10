#!/bin/bash

source HostnameConfig.sh
source UserConfig.sh

echo $OLD_PASSWD_Name | rsync -avz -e 'ssh' scripts $OLD_USER_Name@$OLD_PASSWD_Name:~/scripts
