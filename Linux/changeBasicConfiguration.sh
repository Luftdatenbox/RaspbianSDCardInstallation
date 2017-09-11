#!/bin/bash

# this script changes the basic rapsberry pi configurations: user name, user password, hostname

## change user name
# create tempuser
rsync -avz -e 'sshpass -p '$OLD_PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/addTmpUser.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local './addTmpUser.sh'

# change username
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local './scripts/changeUserName.sh'

# delete tempuser
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local './scripts/addTmpUser.sh'


## change password
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local './scripts/changePasswd.sh'


## change hostname
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local './scripts/changeHostname.sh'
# reboot after hostname change
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local 
'echo '$PASSWD_Name' | sudo reboot'



## install fail2ban
#sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './scripts/changeHostname.sh'
