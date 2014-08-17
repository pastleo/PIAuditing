#!/bin/bash

useradd pastleo
echo 'pastleo  ALL=(ALL:ALL) ALL' >> /etc/sudoers
su pastleo -l -c 'sh /env.sh/pastleo.setting/install.sh'
echo "PS1.hostname_on" >> /home/pastleo/.bashrc
