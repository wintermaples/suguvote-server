#!/bin/sh

cd `dirname $0`

sudo rm -R ./deploy/
mkdir ./deploy/

chmod +x ./backend_deploy.sh
./backend_deploy.sh
cd `dirname $0`
chmod +x ./frontend_deploy.sh
./frontend_deploy.sh
