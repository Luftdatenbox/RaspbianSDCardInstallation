#!/bin/bash

source HostnameConfig.sh
source UserConfig.sh

rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/updateAptGet.sh $USER_Name@$HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './updateAptGet.sh'
