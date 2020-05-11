#!/bin/sh

sudo systemctl stop nginx
sudo systemctl stop emperor.uwsgi.service
sudo systemctl stop mongob

sudo rm -R suguvote-server/
git clone git@suguvote-server:wintermaples/suguvote-server.git suguvote-server
chmod +x suguvote-server/deploy.sh
./suguvote-server/deploy.sh

sudo systemctl restart mongob
sudo systemctl restart emperor.uwsgi.service
sudo systemctl restart nginx
