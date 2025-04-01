#!/bin/bash

#update packages
sudo apt update -y

#upgrade packages
sudo NEEDRESTART_MODE=a apt-get dist-upgrade --yes

#install gnugp and curl
sudo NEEDRESTART_MODE=a apt install gnupg curl -y

#Add the gpg key
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

#Create sources list file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#Update the package list again
sudo apt update -y

#install mongoDB
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

#Change the bindIP in the config file
sudo sed -i "s/bindIp: 127.0.0.1/bindIP: 0.0.0.0/" /etc/mongod.conf

#start mongoDB
sudo systemctl start mongod

#check its running
sudo systemctl status mongod