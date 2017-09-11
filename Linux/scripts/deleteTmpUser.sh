#!/bin/bash

# delete temporary user
echo $PASSWD_Name | sudo userdel tempuser
