#!/bin/bash

## install docker compose
# set up pip
sudo apt install python-pip -y
sudo pip install --upgrade pip

# create virtualenv for docker-compose
#sudo pip install virtualenv
#mkdir ~/.docker-compose_virtualenv/
#cd ~/.docker-compose_virtualenv/
#virtualenv env
#source env/bin/activate

# install docker-compose
sudo pip install docker-compose
#deactivate

# set docker-compose as alias to the environment
#echo "alias docker-compose='~/.docker-compose_virtualenv/env/bin/docker-compose'" >> ~/.bashrc


