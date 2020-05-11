#!/bin/sh

cd $(cd $(dirname $0)/.. && pwd)

sudo rm -R /var/www/html/
sudo mkdir /var/www/html/
cd deploy/
sudo rm -R suguvote-front/
git clone -b dev git@suguvote-front:wintermaples/suguvote-front.git
cd suguvote-front/
sudo cp -R dist/* /var/www/html/
