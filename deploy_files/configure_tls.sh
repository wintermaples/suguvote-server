#!/bin/sh

if [ "$FORCE_RENEWAL_TLS" = "True" ]; then
  echo "===== FORCE_RENEWAL_TLS is True ====="
  sudo certbot --force-renewal --nginx -w /var/www/html/ -d www.suguvote.net -d suguvote.net -m tpgwinter@gmail.com --agree-tos -n
  sudo certbot --force-renewal certonly --webroot -w /var/www/html/ -d api.suguvote.net -m tpgwinter@gmail.com --agree-tos -n
else
  sudo certbot --nginx -w /var/www/html/ -d www.suguvote.net -d suguvote.net -m tpgwinter@gmail.com --agree-tos -n
  sudo certbot --webroot certonly -w /var/www/html/ -d api.suguvote.net -m tpgwinter@gmail.com --agree-tos -n
fi