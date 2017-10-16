#!/bin/bash

# this is a template to show how you can execute own scripts on the Raspberry Pi using this environment
# We transfer and execute the ownscripts/echoHelloWorld.sh to the Pi and then execute it
# If you want to write your own script, just copy and adept this scripts

# include this files to have the login information
source HostnameConfig.sh
source UserConfig.sh

# describe where the script is and how it is named
scriptDirectory="ownscripts" # no shash (/) at the end
scriptName="echoHelloWorld.sh"

# transfer the script to the pi (e.g. home directoy ~/)
rsync -avz -e 'sshpass -p '$PASSWD_Name' ssh -o StrictHostKeyChecking=no' \
$scriptDirectory/$scriptName $USER_Name@$HOSTNAME_Name.local:~/

# execute the script
sshpass -p $PASSWD_Name ssh -o StrictHostKeyChecking=no $USER_Name@$HOSTNAME_Name.local ./$scriptName
