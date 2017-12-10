#!/bin/bash

source StaticIpConfig.sh
source HostnameConfig.sh
source UserConfig.sh

# set up static ip - deactivating dhcp

# transmit configuration file
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
StaticIpConfig.sh $USER_Name@$HOSTNAME_Name.local:~/

# transmit configuration script
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/configureStaticIp.sh $USER_Name@$HOSTNAME_Name.local:~/

# run configuration script
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './configureStaticIp.sh'

# reboot
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/reboot.sh $USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local './reboot.sh'

