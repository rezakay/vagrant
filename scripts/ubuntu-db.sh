#!/bin/bash

#making login credentials or mysql

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Installing mysql

sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql  

# showing databases

sudo mysql -u root -proot  -e "SHOW DATABASES;"
