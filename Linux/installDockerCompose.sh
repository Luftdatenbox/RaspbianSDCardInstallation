#!/bin/bash

source HostnameConfig.sh
source UserConfig.sh

# install Docker
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/installDocker.sh $USER_Name@$HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './installDocker.sh'

# install DockerCompose
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
scripts/installDockerCompose.sh $USER_Name@$HOSTNAME_Name.local:~/
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local './installDockerCompose.sh'
