#!/bin/sh

sudo rm -R /var/www/html/
sudo mkdir /var/www/html/
cd ~/deploy/
sudo rm -R suguvote-front/
git clone git@suguvote-front:wintermaples/suguvote-front.git
cd suguvote-front/
yarn run webpack --mode production
sudo cp -R dist/* /var/www/html/
