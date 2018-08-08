#!/bin/bash
DB=$1
USER=$2
PASSWORD=$3
DB_HOST=$4

sudo apt-get update
sudo apt-get -y install apache2 php5-mysql php5 libapache2-mod-php5
sudo rm /var/www/html/index.html

wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz -C /var/www/html/
sudo rm latest.tar.gz

sudo mv -f /var/www/html/wordpress/* /var/www/html/
sudo mv -f /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo sed -i "s/localhost/$DB_HOST/g" /var/www/html/wp-config.php
sudo sed -i "s/username_here/$USER/g" /var/www/html/wp-config.php
sudo sed -i "s/password_here/$PASSWORD/g" /var/www/html/wp-config.php
sudo sed -i "s/database_name_here/$DB/g" /var/www/html/wp-config.php
sudo service apache2 restart