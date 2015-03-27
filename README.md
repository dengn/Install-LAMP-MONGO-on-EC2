# Install-LAMP-MONGO-on-EC2
These are the scripts to install LAMP and MongoDB on EC2 virtual machine.

1. Launch an EC2 Amazon Linux instance.
2. You may need to edit the security group and blabla as the official tutorial suggests.
3. Log on by SSH, "sudo sh install_lamp_1.sh", which will help you to install the complete LAMP, you should make the initial configurations of MySQL.
4. After the install_lamp_1.sh, the machine will reboot. Relog on, and install the second part. 
5. After the LAMP part is done, run "sudo sh mongo_install.sh".
