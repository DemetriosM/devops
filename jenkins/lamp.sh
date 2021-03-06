#!/bin/bash
DB=$1
USER=$2
PASSWORD=$3

sudo apt-get update
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password password"
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password password"
sudo apt-get -y install mysql-server mysql-client

mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password';"
mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -ppassword -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASSWORD';" 
mysql -uroot -ppassword -e "GRANT USAGE ON *.* TO '$USER'@'%';"
mysql -uroot -ppassword -e "CREATE DATABASE IF NOT EXISTS $DB;"
mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'%' IDENTIFIED BY '$PASSWORD';"
mysql -uroot -ppassword -e "FLUSH PRIVILEGES;"
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
sudo service mysql restart

sudo apt-get update
sudo apt-get -y install apache2 php php-mysql libapache2-mod-php
sudo rm /var/www/html/index.html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 775 /var/www/html
sudo usermod -a -G www-data vagrant
sudo service apache2 restart

sudo apt-get install -y openssh-server
