#!/bin/sh

cd `dirname $0`

# Install required packages.
sudo apt-get update
sudo apt-get install build-essential python3.8 python3.8-dev -y
sudo apt-get install nginx -y
sudo systemctl stop nginx
sudo apt-get install mongodb -y
sudo systemctl stop mongod

# Install pipenv.
sudo pip install pipenv


##### Setup uwsgi #####

# Install uwsgi.
sudo pip install uwsgi

# Copy emperor.uwsgi.service for systemd.
sudo cp systemd/emperor.uwsgi.service /etc/systemd/system/

# Make directories for running uwsgi on emperor mode.
sudo mkdir /etc/uwsgi/
sudo mkdir /etc/uwsgi/vassals/
# Copy emperor.ini.
sudo cp uwsgi/emperor.ini /etc/uwsgi/

# Enable emperor.uwsgi.service.
sudo systemctl enable emperor.uwsgi.service


##### Setup nginx #####

# Copy default site configuration file.
sudo cp nginx/sites-enabled/default /etc/nginx/sites-enabled/


##### Deploy #####
chmod +x ./deploy_files/deploy.sh
chmod +x ./deploy_files/redeploy.sh
./deploy_files/deploy.sh


##### Boot services #####
sudo systemctl start mongod
sudo systemctl start emperor.uwsgi.service
sudo systemctl start nginx
