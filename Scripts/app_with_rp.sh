#!/bin/bash

#update
sudo apt update -y

#upgrade add fix/mitigate
sudo NEEDRESTART_MODE=a apt-get dist-upgrade --yes
sudo apt upgrade -y #This bit is probably redundant

#install nginx
sudo apt install nginx -y

#Add rp here
#See reverse proxy notes for what to do

#enable nginx
sudo systemctl enable nginx

#get app code - cannot use scp (hint: use github and git)
git clone https://github.com/JamesC830/nodejs-sparta-test-app.git

#install nodejs v20.x 
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

#check version
node -v

#cd into app folder
cd nodejs-sparta-test-app
cd app

#install app
sudo npm install

#start app
sudo npm start app.js &