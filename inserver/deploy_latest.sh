#!/bin/sh

sudo systemctl stop nginx
sudo systemctl stop emperor.uwsgi.service
sudo systemctl stop mongod

. ./set_environments.sh
sudo rm -R suguvote-server/
git clone -b "alpha-dev.3-r1" git@suguvote-server:wintermaples/suguvote-server.git suguvote-server
chmod +x suguvote-server/deploy.sh
./suguvote-server/deploy.sh

sudo systemctl restart mongod
sudo systemctl restart emperor.uwsgi.service
sudo systemctl restart nginx
