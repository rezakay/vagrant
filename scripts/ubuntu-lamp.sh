#!/bin/bash

sudo apt-get update

sudo apt-get -y install apache2

sudo /etc/init.d/apache2 stop


rm -rf /var/www/html

ln -s /vagrant /var/www/html

#making login credentials or mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt-get -y install mysql-server

sudo mysql -u root -proot  -e "SHOW DATABASES;"


sudo apt-get -y --ignore-missing install php5 libapache2-mod-php5 


# Download starter content

cd /vagrant

sudo -i -u vagrant wget -q https://raw.githubusercontent.com/rezakay/vagrant/master/files/index.html
sudo -i -u vagrant wget -q https://raw.githubusercontent.com/rezakay/vagrant/master/files/info.php

php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'




