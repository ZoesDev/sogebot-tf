#!/bin/bash


echo "initial setup"
sudo apt update
sudo apt upgrade -y #updating system image to make sure everything is updated


#setup docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


# install packages that will be needed
sudo apt-get install -y unzip jq nginx certbot python3-certbot-nginx docker-ce docker-compose

#install sogebot
echo "install sogebot"

#download zip
cd /tmp
LOCATION=$(curl -s https://api.github.com/repos/sogebot/sogeBot-docker/releases/latest \
| grep "zipball_url" \
| awk '{ print $2 }' \
| sed 's/,$//'       \
| sed 's/"//g' )     \
; curl -L -o sogebot.zip $LOCATION

#unzip file

unzip /tmp/sogebot.zip –d /home/ubuntu/sogebot


docker-compose -f /home/ubuntu/sogebot/docker-compose.yml

#check if there is a backup file in the s3 db if not skip. will be skipped on frist run as there wont be any backup around



#install nginx for proxy

echo "installing nginx and certbot"



echo "forwarding logs to cloudwatch for visibility"


echo "setting up s3 backup for sqlite db"