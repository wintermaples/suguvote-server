#!/bin/sh

# !!!!! This script assumes webserver services are stopped. !!!!!
# !!!!! And this script doesn't start webserver services. !!!!!

cd $(cd $(dirname $0)/.. && pwd)

sudo rm -R ./deploy_files/deploy/
mkdir ./deploy_files/deploy/

chmod +x deploy_files/server_deploy.sh
./deploy_files/server_deploy.sh
cd $(cd $(dirname $0)/.. && pwd)
chmod +x deploy_files/backend_deploy.sh
./deploy_files/backend_deploy.sh
cd $(cd $(dirname $0)/.. && pwd)
chmod +x deploy_files/frontend_deploy.sh
./deploy_files/frontend_deploy.sh
