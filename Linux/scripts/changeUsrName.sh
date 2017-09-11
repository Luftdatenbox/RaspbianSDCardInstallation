#!/bin/bash

source UserConfig.sh

#change username
# reference: http://unixetc.co.uk/2016/01/07/how-to-rename-the-default-raspberry-pi-user/


# create a backup:
cd /etc
#in older version (jessie and prior) we also need to take care of lightdm and desktop-policy
#echo $PASSWD_Name | sudo tar -cvf authfiles.tar passwd group shadow gshadow sudoers lightdm/lightdm.conf systemd/system/autologin@.service sudoers.d/* polkit-1/localauthority.conf.d/60-desktop-policy.conf
echo $PASSWD_Name | sudo tar -cvf authfiles.tar passwd group shadow gshadow sudoers systemd/system/autologin@.service sudoers.d/*

# rename all occurence of pi in relevant access-policy files
#in older version (jessie and prior) we also need to take care of lightdm and desktop-policy
#echo $PASSWD_Name | sudo sed -i.$(date +'%y%m%d_%H%M%S') 's/\b'"$OLD_USER_Name"'\b/'"$USER_Name"'/g' passwd group shadow gshadow sudoers lightdm/lightdm.conf systemd/system/autologin@.service sudoers.d/* polkit-1/localauthority.conf.d/60-desktop-policy.conf
echo $PASSWD_Name | sudo sed -i.$(date +'%y%m%d_%H%M%S') 's/\b'"$OLD_USER_Name"'\b/'"$USER_Name"'/g' passwd group shadow gshadow sudoers systemd/system/autologin@.service sudoers.d/*

# move home directory
echo $PASSWD_Name | sudo mv /home/$OLD_USER_Name /home/$USER_Name
# create softlink so gui keeps working
echo $PASSWD_Name | sudo ln -s /home/$USER_Name /home/$OLD_USER_Name

# renaming done
# login via ssh with new user now



