#!/bin/sh

cd `dirname $0`

sudo systemctl stop nginx
sudo systemctl stop emperor.uwsgi.service

chmod +x ./deploy.sh
./deploy.sh

sudo systemctl start emperor.uwsgi.service
sudo systemctl start nginx
