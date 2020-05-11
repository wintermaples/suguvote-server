#!/bin/sh

sudo certbot --nginx -w /var/www/html/ -d www.suguvote.net -d suguvote.net -m tpgwinter@gmail.com --agree-tos -n
sudo certbot certonly --nginx -w /var/www/html/ -d api.suguvote.net -m tpgwinter@gmail.com --agree-tos -n