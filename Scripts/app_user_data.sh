#!/bin/bash

#Swap user to ubuntu
sudo -u ubuntu -i << EOF
echo "Running as the ubuntu user"

#Swap to ubuntu home directory
cd

#Wait for image script to run
sleep 20

cd nodejs-sparta-test-app
cd app

#Install npm
sudo npm install

sleep 2

#Need to manually insert <db-ip-address>
export DB_HOST=mongodb://<db-ip-address>:27017/posts
printenv DB_HOST

sleep 2

#Seed the posts database
node seeds/seed.js

sleep 2
 
# run the app with pm2 (in the background by default)
pm2 start app.js

#Stop being ubuntu as user
EOF