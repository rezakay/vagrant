#!/bin/bash

# Installing apache

sudo apt-get -y install apache2

ifconfig eth0 | grep inet | awk '{ print $2 }'

sudo /etc/init.d/apache2 stop

# creating symbolic link between /vagrant and /var/www {server root}

sudo rm -rf /var/www

sudo ln -s /vagrant /var/www


sudo /etc/init.d/apache2 start

# Installing php5

sudo apt-get -y --ignore-missing install php5 libapache2-mod-php5 php5-mcrypt php5-cli php5-common


# Download starter content into "/vagrant". content is accesible from /var/www {server root}

cd /vagrant

sudo -i -u vagrant wget -q https://raw.githubusercontent.com/rezakay/vagrant/master/files/index.html -P /vagrant
sudo -i -u vagrant wget -q https://raw.githubusercontent.com/rezakay/vagrant/master/files/info.php -P /vagrant


ls /vagrant

sudo /etc/init.d/apache2 restart

# Testing PHP

php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'


