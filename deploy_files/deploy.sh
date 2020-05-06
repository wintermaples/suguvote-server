#!/bin/sh

sudo rm -R ./deploy/
mkdir ./deploy/

./backend_deploy.sh

./frontend_deploy.sh
