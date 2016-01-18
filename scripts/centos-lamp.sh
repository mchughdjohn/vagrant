#!bin/bash

# Update without the kernal update
yum update -y --exclude=kernal

# Tools install nano git unzip and screen
yum install -y nano git unzip screen

# APACHE
yum  install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html

ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download starter content

cd /vagrant
sudo -u vagrant wget -q https://raw.gihubusercontent.com/mchughdjohn/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.gihubusercontent.com/mchughdjohn/vagrant/master/files/info.php

# Restart command

service httpd restart