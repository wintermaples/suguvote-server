#!/bin/sh

cd `dirname $0`

##### Setup uwsgi #####

# Remove and Copy emperor.uwsgi.service for systemd.
sudo rm /etc/systemd/system/emperor.uwsgi.service
sudo cp systemd/emperor.uwsgi.service /etc/systemd/system/
# Reload systemctl.
sudo systemctl daemon-reload
# Enable emperor.uwsgi.service.
sudo systemctl enable emperor.uwsgi.service

# Make directories for running uwsgi on emperor mode.
sudo mkdir /etc/uwsgi/
sudo mkdir /etc/uwsgi/vassals/
# Remove and Copy emperor.ini.
sudo rm /etc/uwsgi/emperor.ini
sudo cp uwsgi/emperor.ini /etc/uwsgi/


##### Setup mongod #####
sudo rm /etc/mongod.conf
sudo cp mongo/mongod.conf /etc/


##### Setup nginx #####

# Remove and Copy default site configuration file.
sudo rm /etc/nginx/sites-enabled/default
sudo cp nginx/sites-enabled/default /etc/nginx/sites-enabled/

# Configure tls
chmod +x configure_tls.sh
./configure_tls.sh
ps aux | grep nginx | grep -v grep | awk '{ print "kill ", $2 }' | sh # certbot nginx plugin bug
sudo systemctl stop nginx
