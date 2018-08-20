#!/bin/bash

sudo apt-get update
sudo apt-get -y install default-jre

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins

sudo -H -u jenkins bash -c 'ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa'
