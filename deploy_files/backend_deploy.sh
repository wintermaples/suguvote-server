#!/bin/sh

cd `dirname $0`

sudo rm -R /var/www/suguvote-back/
sudo mkdir /var/www/suguvote-back/
cd deploy/
sudo rm -R suguvote-back/
git clone -b "alpha-dev.3-r1" git@suguvote-back:wintermaples/suguvote-back.git
sudo cp -R suguvote-back/* /var/www/suguvote-back/
sudo chown -R www-data:www-data /var/www/suguvote-back/

cd /var/www/suguvote-back/
sudo pipenv install
sudo pipenv install --system
sudo -u www-data -E python3.8 manage.py migrate
sudo -u www-data -E python3.8 manage.py collectstatic

sudo rm /etc/nginx/sites-enabled/suguvote_nginx.conf
sudo rm /etc/uwsgi/vassals/suguvote_uwsgi.ini
if [ $NO_USE_TLS != "True" ]; then
  sudo ln -s /var/www/suguvote-back/suguvote_nginx_no_use_tls.conf /etc/nginx/sites-enabled/
else
  sudo ln -s /var/www/suguvote-back/suguvote_nginx.conf /etc/nginx/sites-enabled/
fi
sudo ln -s /var/www/suguvote-back/suguvote_uwsgi.ini /etc/uwsgi/vassals/
