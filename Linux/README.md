
software:
dd
unzip
sshpass
rsync

SDCard contains scripts to automatically download and install Raspbian on an SD Card (including enabling ssh)

This discovery contains scripts to automatically change basic settings and install software (docker and docker-compose).
The script changeBasicConfiguration.sh changes user name, user password, hostname and reboots the pi to apply the hostname change.

The configuration for the hostname is applied from HostnameConfig.sh and the configuration for the user name and password is taken from UserConfig.sh.
