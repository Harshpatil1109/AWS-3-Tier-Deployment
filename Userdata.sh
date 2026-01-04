Create a file named install_wordpress.sh in your scripts folder. This is the "code" part of your project that automates the EC2 setup:

#!/bin/bash
# Update system and install Apache, PHP, and MySQL client
yum update -y
yum install -y httpd php php-mysqlnd mariadb

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/

# Set permissions
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

# Clean up
rm -rf wordpress latest.tar.gz
