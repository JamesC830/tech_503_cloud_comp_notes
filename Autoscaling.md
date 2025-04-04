# Autoscaling and load balancing notes

### Scaling:
- ***Verical***: Bigger, more powerful CPU
- ***Horizontal***: More CPUs

![Image](.\Images\James_ASG.png)


### Abreviations
- HA: High availability
- SC: Scalability
- SLA: Service level Agreement
- SLO: Service level Objective
- SLI: Service level Indicator
- SRE: Site reliability engineer
- ASG: Auto scaling group

## Setting up ASG

**Remember to add tags with names to everything**

# 1. Launch template

![alt text](.\Images\image.png)

- Create launch template
- Name: tech503-james-lt-for-sparta-app
- Select Auto-Scaling guidance
- Select tech503-james-app-image
- Instance t2.micro
- Key pair usual
- Network settings: basic security group
- Resource tags: Name: tech503-james-spata-app
- Advanced details: Add user data

example user data

```
#!/bin/bash

#Swap user to ubuntu
sudo -u ubuntu -i << EOF
echo "Running as the ubuntu user"

#Swap to ubuntu home directory
cd

#Wait for image script to run
sleep 30

cd nodejs-sparta-test-app
cd app

#Install npm
sudo npm install

sleep 10
 
# run the app with pm2 (in the background by default)
pm2 start app.js

#Stop being ubuntu as user
EOF
```

![alt text](.\Images\image-1.png)

Here is the summary of what you need
- Create launch template

To test it works, you can launch an instance from the template

### Auto-scaling groups

- Name: tech503-james-sparta-app-asg
- Next
- Availability zones and subnets:
  - eu-west-1a | subnet-0429d69d55dfad9d2 (DevOpsStudent default 1a)
  - 1b
  - 1c
- Distribution: Balanced best effort
- Load balancer: Attatch a new load balancer

**Load balancer**

- Application load balancer
- Name: tech503-james-sparta-app-lb
- Scheme: Internet facing
- Health checks: Turn on Elastic Load Balancing health checks
- Listeners and routing:
  - Create a target group
  - Name: tech503-james-sparta-app-tg
  - Add tag for naming instances
- Next

**Back to autoscaling groups**
- Desired capacity: 2
- Scaling: 
  - Min: 2, Max: 3
  - Target tracking scaling policy
  - Name: tech503-james-app-sp
- Next
- Next
- Tags: Name: tech503-james-app-asg
- Next

**Full summary**
![alt text](.\Images\image-2.png)
![alt text](.\Images\image-3.png)
![alt text](.\Images\image-4.png)
![alt text](.\Images\image-5.png)
![alt text](.\Images\image-6.png)
![alt text](.\Images\image-7.png)
![alt text](.\Images\image-8.png)

