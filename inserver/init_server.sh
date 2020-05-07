#!/bin/sh

cd `dirname $0`

# Install required packages.
sudo apt-get update
sudo apt-get install wget -y
# Install python3.8.
sudo apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev
curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz
tar -xf Python-3.8.2.tar.xz
cd Python-3.8.2
./configure --enable-optimizations
make
sudo make altinstall
cd ..
sudo rm Python-3.8.2.tar.xz
sudo rm -R Python-3.8.2/
# Install mongodb4.2.
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
rm server-4.2.asc
# Install other required packages.
sudo apt-get install build-essential nginx git -y

# Get pip.
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.8 get-pip.py
rm get-pip.py

# Install pipenv.
sudo pip install pipenv

# Install uwsgi.
sudo pip install uwsgi
