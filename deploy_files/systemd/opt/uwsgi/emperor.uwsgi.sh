#!/bin/sh

/var/www/uwsgi_env.sh
uwsgi --ini /etc/uwsgi/emperor.ini
