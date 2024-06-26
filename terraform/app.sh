#!/bin/bash

DB_HOST=${aws_instance.spencer_db_instance.private_ip}

sudo apt update && sudo apt upgrade -y

# Install Python 3.9
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update -y
sudo apt install -y python3.9 python3.9-venv python3.9-dev
sudo apt install -y python3-pip

git clone https://github.com/developedbyluke/tech257-northwind-app.git repo
cd repo/app

python3.9 -m venv venv
source venv/bin/activate

pip install Flask==3.0.2 Waitress==3.0.0 Flask-SQLAlchemy==3.1.1 SQLAlchemy==2.0.27 PyMySQL==1.1.0 Jinja2==3.1.3 Flask-Waitress==0.0.1 cryptography

#import private_ip variable from main.tf to use in db_connection_uri in app.sh

export DB_CONNECTION_URI="mysql+pymysql://admin:password@${DB_HOST}:3306/northwind"

waitress-serve --port=5000 northwind_web:app