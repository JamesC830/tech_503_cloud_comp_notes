#!/bin/bash

#Note: If launching from image when copying the EC2
#script to enter the image
#Change root to ubuntu

#update
sudo apt update -y

#upgrade add fix/mitigate
sudo NEEDRESTART_MODE=a apt-get dist-upgrade --yes
sudo apt upgrade -y #This bit is probably redundant

#install nginx
sudo apt install nginx -y

# $ and / characters must be escaped by putting a backslash before them
sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:3000\/;/" /etc/nginx/sites-available/default

# restart nginx
sudo systemctl restart nginx

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
#sudo npm start app.js &

# install pm2 - process manager package for nodejs apps
sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g
 
# kill any running node processes that could interfere
#maybe this is the issue
pm2 kill

#If launching from image navigate to app folder
#cd nodejs-sparta-test-app
#cd app

#Need to manually insert <db-ip-address>
export DB_HOST=mongodb://<db-ip-address>:27017/posts
printenv DB_HOST

#Seed the posts database
node seeds/seed.js
 
# run the app with pm2 (in the background by default)
pm2 start app.js