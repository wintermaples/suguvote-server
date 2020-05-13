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
sudo apt-get install build-essential nginx git memcached mariadb-server -y

# Get pip.
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.8 get-pip.py
rm get-pip.py

# Install pipenv, uwsgi, pymongo.
sudo pip install pipenv uwsgi pymongo

# Install certbot.
sudo apt-get install certbot python-certbot-nginx -y

# Init mongodb
python3.8 init_mongodb.py

# Make directories for running uwsgi on emperor mode.
sudo mkdir /etc/uwsgi/
sudo mkdir /etc/uwsgi/vassals/

# Mkdir uwsgi log folder.
sudo mkdir /var/log/uwsgi/
sudo chown www-data:www-data /var/log/uwsgi/

# Enable mongod.
sudo systemctl enable mongod

# Setup mariadb.
echo "Please enter suguvote password: "
read password
sudo mysql_secure_installation --use-default
sudo mysql -u root -p -e "CREATE DATABASE suguvote;CREATE USER IF NOT EXISTS suguvote@'localhost' IDENTIFIED BY '$password';GRANT ALL ON suguvote.* TO 'suguvote'@'localhost';"