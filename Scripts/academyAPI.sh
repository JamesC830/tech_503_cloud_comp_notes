#!/bin/bash

#Avoid purple screen
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf

#last resort
#sudo apt-get remove needrestart

#update
sudo apt update -y

#upgrade add fix/mitigate
sudo NEEDRESTART_MODE=a apt-get dist-upgrade --yes
sudo DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade --y

#Got the purple screen a couple of times, need to fix
#Install requried dependancies
#nginx
sudo apt install nginx -y
#git
sudo apt install git -y
#curl
sudo apt install curl -y
#unzip
sudo apt install unzip -y

#Install .NET SDK
sudo apt install -y dotnet-sdk-8.0

#Clone the private github repo
#PAT: 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
git clone https://JamesC830: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@github.com/JamesC830/sparta_asp.net_api.git

#Unzip the file
cd sparta_asp.net_api
unzip sparta-api-main.zip

#Delete the zip file
rm sparta-api-main.zip

#Enter the api repo
#Or maybe I publish the repo? Not really sure
cd sparta-api-main

#Publish the ASP.NET API
#dotnet publish

#Delete the cloned repository

#Enter API directory
cd SpartaAcademyAPI

#Set up Nginx as a reverse proxy
# $ and / characters must be escaped by putting a backslash before them
sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:5125\/;/" /etc/nginx/sites-available/default
# restart nginx
sudo systemctl restart nginx
#enable nginx
sudo systemctl enable nginx

#Run the published app
dotnet run SpartaAcademyAPI.csproj