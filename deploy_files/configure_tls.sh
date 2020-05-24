#!/bin/sh

if [ $NO_USE_TLS != "True" ]; then
  sudo certbot --nginx -w /var/www/html/ -d www.suguvote.net -d suguvote.net -m tpgwinter@gmail.com --agree-tos -n
  sudo certbot --webroot certonly -w /var/www/html/ -d api.suguvote.net -m tpgwinter@gmail.com --agree-tos -n
else
  sudo certbot --staging -w /var/www/html/ -d www.suguvote.net -d suguvote.net -m tpgwinter@gmail.com --agree-tos -n
  sudo certbot --staging certonly -w /var/www/html/ -d api.suguvote.net -m tpgwinter@gmail.com --agree-tos -n
fi
