#!/bin/sh

export DJANGO_SECRET_KEY=

sudo systemctl stop nginx
sudo systemctl stop emperor.uwsgi.service
sudo systemctl stop mongod

sudo rm -R suguvote-server/
git clone -b alpha-dev1 git@suguvote-server:wintermaples/suguvote-server.git suguvote-server
chmod +x suguvote-server/deploy.sh
./suguvote-server/deploy.sh

sudo systemctl restart mongod
sudo systemctl restart emperor.uwsgi.service
sudo systemctl restart nginx
