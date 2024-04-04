#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt-get install mysql-server -y

git clone https://github.com/developedbyluke/tech257-northwind-app.git repo

sudo mysql <<EOF
CREATE DATABASE northwind;
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON northwind.* TO 'admin'@'%';
FLUSH PRIVILEGES;
EOF

cd /repo/app
sudo mysql northwind < northwind_sql.sql

# Comment out bind-address in mysql config
sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql