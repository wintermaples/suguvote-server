#!/bin/sh

source /opt/uwsgi/uwsgi_env.sh
uwsgi --ini /etc/uwsgi/emperor.ini
