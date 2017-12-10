#!/bin/bash

source HostnameConfig.sh
source UserConfig.sh

# disable avahi - mDNS
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/disableAvahi.sh $USER_Name@$HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './disableAvahi.sh'

