#!/bin/bash

#Add MongoDB source
echo "[MongoDB]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64
gpgcheck=0
enabled=1" | sudo tee -a /etc/yum.repos.d/mongodb.repo

sudo yum -y update
#install MongoDB Server
sudo yum install -y mongodb-org-server mongodb-org-shell mongodb-org-tool                                                                                                                                                             s
#Create MongoDB db 
sudo mkdir /data/db
#Install the necessary for MongoDB
sudo yum install openssl-devel
sudo yum install cyrus-sasl-devel
sudo yum install gcc
sudo yum install php55-devel
#Install MongoDB
sudo pecl install mongo
#Add the php mongodb driver
sudo sed -i '863s/.*/    extension=mongo.so/' /etc/php.ini
#set php_ini to the right position
sudo pecl config-set php_ini /etc/php.ini
#Set mongod to autostart
sudo /sbin/chkconfig mongod on
#launch mongod
sudo service mongod restart

#download rock-mongo
sudo wget https://github.com/iwind/rockmongo/archive/master.zip
sudo unzip master.zip
sudo mv rockmongo-master rockmongo
sudo mv rockmongo /var/www/html/

