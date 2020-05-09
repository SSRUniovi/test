# Custom Script for Linux
 
#!/bin/bash

{
sudo sed -i "s/pm.min_spare_servers = 1/pm.min_spare_servers = 2/" /etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i "s/pm.max_spare_servers = 3/pm.max_spare_servers = 5/" /etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i "s/;pm.max_request/pm.max_request/" /etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i "s/;security.limit_extensions = .php .php3 .php4 .php5 .php7/security.limit_extensions = .php/" /etc/php/7.0/fpm/pool.d/www.conf

 
sudo systemctl restart php7.0-fpm.service

sudo apt install software-properties-common
sudo add-apt-repository ppa:nginx/stable -y
sudo apt -y update
sudo DEBIAN_FRONTEND=noninteractive apt -y install -o Dpkg::Options::="--force-confold" nginx 

sudo systemctl restart nginx
} > setup-adicional.log