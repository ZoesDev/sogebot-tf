#!/bin/bash


echo "initial setup"
sudo apt update
sudo apt upgrade -y #updating system image to make sure everything is updated

#setup hostname for later
HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/public-hostname)
WEBMASTER=${webmaster}

#setup docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install packages that will be needed
sudo apt-get install -y unzip jq nginx certbot python3-certbot-nginx docker-ce docker-compose awscli
sudo usermod -aG docker ubuntu
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


docker-compose -f /home/ubuntu/sogebot/docker-compose.yml -d

#check if there is a backup file in the s3 db if not skip. will be skipped on frist run as there wont be any backup around
#TODO late


#install nginx for proxy

echo "installing nginx and certbot"
cat >> /etc/nginx/sites-enabled/sogebot <<EOF
server {
    listen 80;
    server_name $HOSTNAME;
    location / {
        proxy_pass http://127.0.0.1:20000; # change port if you are running on different than default port
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

systemctl restart nginx

certbot --non-interactive --agree-tos -m $WEBMASTER

certbot --nginx -d $HOSTNAME --redirect


#TODO late belose this line
echo "forwarding logs to cloudwatch for visibility"


echo "setting up s3 backup for sqlite db"