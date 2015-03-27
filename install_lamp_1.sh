#!/bin/bash
##Require allerver and then install the lamp stack
sudo yum update -y
 
## install PHP 55
## this also installs apache as it's a dependecy in amazons version of php55
sudo yum install -y php55 php55-mysqlnd php55-bcmath php55-gd php55-xml php55-mbstring php55-mcrypt php55-soap php55-xml
 
## install mysql
sudo yum install -y mysql-server
 
## install git
sudo yum install -y git
 
## start apache
sudo service httpd start
sudo chkconfig httpd on
 
## add a www user group
sudo groupadd www
sudo usermod -a -G www ec2-user
 
## start mysql and make it slightly more secure
sudo service mysqld start
sudo chkconfig mysqld on
sudo mysql_secure_installation
 
## micro instances don't come with swap files so we need to make one
## adding line to fstab so it's enabled on boot
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
sudo mkswap /swapfile
sudo chmod 0600 /swapfile 
sudo swapon /swapfile
sudo sed -i '$ a\/swapfile   swap        swap    defaults          0   0' /etc/fstab
 
# reboot to force logout
sudo reboot
