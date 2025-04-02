# Amazon machine image (AMI) notes

Template for the creation of EC2 instances

## Images

### What are they? 
Templates or blueprints for virtual machines (VMs), containing a complete operating system and pre-installed software, allowing for rapid and consistent deployment of new VMs.

### How do they work? 
When you create a new VM from an image, the cloud provider copies the data from the image onto a virtual disk for the new VM

### Why are they helpful for a business?

- ***Consistency***: ensure that every instance launched from an image is identical in terms of software configuration and settings. This eliminates the possibility of human error during configuration and ensures consistency across environments
- ***Faster Deployment***: Don't need to manually installing an OS and software every time a new VM is needed
- ***Scalability***: Faster deployment helps meet demand quicker when scaling
- ***Cost Efficiency***: Reusing stuff makes it cheaper
- ***Disaster Recovery***: If a critical system goes down, businesses can use their pre-configured image to quickly recover by launching new instances from the image, reducing downtime and ensuring business continuity

## Setting up an instance from an image

- Go to images and create an instance
- When connecting on gitbash you need to change the connect command

e.g ssh -i "tech503-james-aws-key.pem" root@ec2-18-203-95-131.eu-west-1.compute.amazonaws.com

Change the root to unbuntu

e.g ssh -i "tech503-james-aws-key.pem" ubuntu@ec2-18-203-95-131.eu-west-1.compute.amazonaws.com

- When connecting to the db instance do this

```
sudo systemctl start mongod

sudo systemctl enable mongod

sudo systemctl status mongod
```

- When connected to the app instance do this

```
#If launching from image navigate to app folder
cd nodejs-sparta-test-app
cd app

#Need to manually insert <db-ip-address>
export DB_HOST=mongodb://<db-ip-address>:27017/posts
printenv DB_HOST

#Seed the posts database
node seeds/seed.js
 
# run the app with pm2 (in the background by default)
pm2 start app.js
```