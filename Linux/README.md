
software:
dd
unzip
sshpass
rsync

SDCard contains scripts to automatically download and install Raspbian on an SD Card (including enabling ssh)

This discovery contains scripts to automatically change basic settings and install software (docker and docker-compose).
The script changeBasicConfiguration.sh changes user name, user password, hostname and reboots the pi to apply the hostname change.

The configuration for the hostname is applied from HostnameConfig.sh and the configuration for the user name and password is taken from UserConfig.sh.

1th execute changeBasicConfiguration.sh
2th execute other scripts


# Authentiaction
The authenticity of host 'raspberrypi.local (XXX.XXX.XXX.XX)' can't be established.
ECDSA key fingerprint is SHA256:MWh5UUQDgvV9RKhT7M4XBxttTRdMqW4NnNyQglvqb1M.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'raspberrypi.local' (ECDSA) to the list of known hosts.
Warning: the ECDSA host key for 'raspberrypi.local' differs from the key for the IP address '192.168.178.38'
Offending key for IP in /home/bele/.ssh/known_hosts:6
Are you sure you want to continue connecting (yes/no)? yes

then need to remove two from the know hosts:
ssh-keygen -R "raspberrypi.local"
ssh-keygen -R XXX.XXX.XXX.XX
where XXX.XXX.XXX.XX is the IP-Address shown in the first line
then connect once to the pi to add the pi again to the known hosts
ssh pi@raspberrypi.local
Warning: Permanently added the ECDSA host key for IP address '192.168.178.38' to the list of known hosts.
and connect once

now execute the script changeBasicConfiguration.sh


First edit UserConfig.sh, HostNameConfig.sh and if you need to StaticIpConfig.sh
Then run scripts in this order:
changeBasicConfiguration.sh
updateAptGet.sh
installDockerCompose.sh
installFail2Ban.sh
configureStaticIP.sh
disableAvahi.sh

if you do not need to some of the action, just leave the script out.
