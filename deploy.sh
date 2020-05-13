#!/bin/sh

# !!!!! This script assumes webserver services are stopped. !!!!!
# !!!!! And this script doesn't start webserver services. !!!!!

cd `dirname $0`

sudo rm -R ./deploy_files/deploy/
mkdir ./deploy_files/deploy/

echo echo $MARIADB_SUGUVOTE_USERNAME

chmod +x deploy_files/server_deploy.sh
./deploy_files/server_deploy.sh
cd `dirname $0`
chmod +x deploy_files/backend_deploy.sh
./deploy_files/backend_deploy.sh
cd `dirname $0`
chmod +x deploy_files/frontend_deploy.sh
./deploy_files/frontend_deploy.sh
