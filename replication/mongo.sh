#!/bin/bash
REPL_SET_NAME=$1
MONGO_IP=$2
echo "$REPL_SET_NAME"
echo "$MONGO_IP"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod stop

sudo mkdir -p /data/db
sudo sed -i "s/var\/lib\/mongodb/data\/db/1" /etc/mongod.conf
sudo sed -i "s/127.0.0.1/127.0.0.1,$MONGO_IP/1" /etc/mongod.conf
sudo sed -i "/#replication:/s/#//" /etc/mongod.conf
sudo sed -i "/replication:/a\  replSetName: $REPL_SET_NAME" /etc/mongod.conf

