#!/bin/bash
NAME=$1
EMAIL=$2

sudo apt-get update
sudo apt-get -y install git
sudo -H -u vagrant bash -c "git config --global user.name '$NAME'"
sudo -H -u vagrant bash -c "git config --global user.email '$EMAIL'"
sudo -H -u vagrant bash -c 'ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa'

