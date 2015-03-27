#!/bin/bash
## fix the folder permissions for the html directory
sudo chown -R root:www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} +
find /var/www -type f -exec sudo chmod 0664 {} +

## fix the httpd.conf so clean urls work
sudo sed -i '151s/.*/    AllowOverride All/' /etc/httpd/conf/httpd.conf
sudo service httpd restart
 
## create a test index.php file
touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php
 
## put a little message saying where to view the phpinfo page
sudo yum -y install cloud-utils
echo "Take a look at the following IP to see your PHP config"
ec2-metadata --public-ipv4m
