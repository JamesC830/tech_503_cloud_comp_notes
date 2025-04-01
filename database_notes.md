# Database notes

### MongoDB setup

Add extra port into the security group

port: 27017

[MongoDB Documentation](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)

### Manual steps after script

Complete these steps after runningh the mongo_db_deploy.sh script

```source script.sh```

Script below for convenience

```
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
   --dearmor -y

#Create sources list file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#Update the package list again
sudo apt update -y

#install mongoDB
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

```

Check its running

```sudo systemctl status mongod```

Go to etc for config

```cd /etc```

Open the config file

```sudo nano mongod.conf```

Change the bindIP (from 127.0.0.1)

Change it to what you have on AWS, e.g.

```0.0.0.0```

Return to home folder

```cd```

Launch mongoDB

```sudo systemctl start mongod```

Check it is active

```sudo systemctl status mongod```

### Connecting DB to app

From here we are working in the app instance

Stop the app running

```pm2 kill```

Will need to use an environment variable. String should be:

```export DB_HOST=mongodb://<db-ip-address>:27017/posts```

Can use ```printenv``` to check

```sudo npm install```

Seed the database

```node seeds/seed.js```

Run the app

```pm2 start app.js```