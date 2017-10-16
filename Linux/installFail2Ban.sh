#!/bin/bash

source HostnameConfig.sh
source UserConfig.sh

# enable fail2ban
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/enableFail2Ban.sh $USER_Name@$HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './enableFail2Ban.sh'

