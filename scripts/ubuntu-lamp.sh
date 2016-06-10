#!/bin/bash

sudo apt-get update

sudo apt-get -y install apache2

ifconfig eth0 | grep inet | awk '{ print $2 }'

sudo /etc/init.d/apache2 stop


sudo rm -rf /var/www

sudo ln -s /vagrant /var/www


sudo /etc/init.d/apache2 start

#making login credentials or mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql  


sudo mysql -u root -proot  -e "SHOW DATABASES;"


sudo apt-get -y --ignore-missing install php5 libapache2-mod-php5 php5-mcrypt php5-cli php5-common


# Download starter content

cd /vagrant

sudo -i -u vagrant wget -q https://raw.githubusercontent.com/rezakay/vagrant/master/files/index.html /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/rezakay/vagrant/master/files/
info.php -P /vagrant

ls /vagrant

sudo /etc/init.d/apache2 restart

php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'




