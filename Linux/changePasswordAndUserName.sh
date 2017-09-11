#!/bin/bash

# reset local key for raspberrypi.local

source HostnameConfig.sh
source UserConfig.sh

# rsync configuration
rsync -avz -e 'sshpass -p '$OLD_PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
HostnameConfig.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/HostnameConfig.sh

rsync -avz -e 'sshpass -p '$OLD_PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
UserConfig.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/UserConfig.sh


## change password
rsync -avz -e 'sshpass -p '$OLD_PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/changePasswd.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $OLD_PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local \
'./changePasswd.sh'


####################

## change user name
# create tempuser
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/addTmpUser.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local \
'./addTmpUser.sh'

# change username
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/changeUsrName.sh $OLD_USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $OLD_USER_Name@$OLD_HOSTNAME_Name.local './changeUsrName.sh'

# delete tempuser
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/deleteTmpUser.sh $USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local \
 './deleteTmpUser.sh'

## change hostname
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/changeHostname.sh $USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local './changeHostname.sh'
# reboot after hostname change
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/reboot.sh $USER_Name@$OLD_HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local './reboot.sh'


#sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$OLD_HOSTNAME_Name.local 'rm ~/*'
