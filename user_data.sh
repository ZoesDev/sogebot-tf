#!/bin/bash


echo "initial setup"
sudo apt update
sudo apt upgrade -y #updating system image to make sure everything is updated


#install nodejs
echo "installing Nodejs"
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs

#install sogebot
echo "install sogebot"


#check if there is a backup file in the s3 db if not skip. will be skipped on frist run as there wont be any backup around



#install nginx for proxy

echo "installing nginx and certbot"



echo "forwarding logs to cloudwatch for visibility"


echo "setting up s3 backup for sqlite db"