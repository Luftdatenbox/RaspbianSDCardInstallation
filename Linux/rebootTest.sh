#!/bin/bash

source HostnameConfig.sh
source UserConfig.sh

# reboot after hostname change
rsync -avz -e 'sshpass -p '$OLD_PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/reboot.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local './reboot.sh'

sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local 'rm ~/*'
