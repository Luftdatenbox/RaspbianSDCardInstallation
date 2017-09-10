#!/bin/bash

# TODO:
# copy files via ssh
# login via ssh
# execute renameUser.sh
# logout


#change username
# reference: http://unixetc.co.uk/2016/01/07/how-to-rename-the-default-raspberry-pi-user/

# TODO login via ssh
# create temporary user - tempuser
sudo useradd -m tempuser
sudo passwd tempuser
sudo usermod -a -G sudo tempuser
logout

# TODO login via ssh to tempuser
#ssh tempuser@$OLD_HOSTNAME_Name.local

# create a backup:
cd /etc
sudo tar -cvf authfiles.tar passwd group shadow gshadow sudoers lightdm/lightdm.conf systemd/system/autologin@.service sudoers.d/* polkit-1/localauthority.conf.d/60-desktop-policy.conf
# rename all occurence of pi in relevant access-policy files
sudo sed -i.$(date +'%y%m%d_%H%M%S') 's/\b'"$OLD_USER_Name"'\b/'"$USER_Name"'/g' passwd group shadow gshadow sudoers lightdm/lightdm.conf systemd/system/autologin@.service sudoers.d/* polkit-1/localauthority.conf.d/60-desktop-policy.conf
# move home directory
sudo mv /home/$OLD_USER_Name /home/$USER_Name
# create softlink so gui keeps working
sudo ln -s /home/$USER_Name /home/$OLD_USER_Name
logout

# renaming done - login as wettermann now
# TODO login via ssh to tempuser
#ssh $USER_Name@$OLD_HOSTNAME_Name.local
# delete tempuser
sudo userdel tempuser

