#!/bin/sh

# Install required packages.
sudo apt-get update
sudo apt-get install nodejs nginx build-essential python3.8 python3.8-dev mongodb -y

# Install yarn, webpack-cli.
sudo npm install -g yarn
sudo yarn -D add webpack-cli

# Install pipenv.
sudo pip install pipenv


##### Setup uwsgi #####

# Install uwsgi.
sudo pip install uwsgi

# Copy emperor.uwsgi.service for systemd.


# Copy emperor.ini.

# Make directories for running uwsgi on emperor mode.
sudo mkdir /etc/uwsgi
sudo mkdir /etc/uwsgi/vassals