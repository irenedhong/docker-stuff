#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling Nginx\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
apt install -yf nginx
service nginx stop
cp /etc/magento/system/resources/magento2.conf /etc/nginx/sites-available/magento2.conf
ln -s /etc/nginx/sites-available/magento2.conf /etc/nginx/sites-enabled/magento2.conf
rm /etc/nginx/sites-enabled/default
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled Nginx\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"