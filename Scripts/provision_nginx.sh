#!/bin/bash

#update
sudo apt update -y

#upgrade
sudo apt upgrade -y

#install nginx
sudo apt install -y

#restart nginx
sudo systemctl restart nginx

#enable nginx
sudo systemctl enable nginx