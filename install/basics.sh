#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling basic dependencies\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
env TERM=linux
apt update
apt install -yq apt-utils
apt install -yq tzdata
ln -fs /usr/share/zoneinfo/Europe/Kiev /etc/localtime &&\
echo "Europe/Kiev" > /etc/timezone &&\
dpkg-reconfigure --frontend noninteractive tzdata
##Installation
apt install -yqf sudo\
    cron\
    openssh-server\
    curl\
    nano\
    software-properties-common
service cron stop
echo "\n127.0.0.1 mage.ua\n" > /etc/hosts
echo 'root:12345abc' | chpasswd
sed -i 's/\#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
echo "export VISIBLE=now" >> /etc/profile
service ssh stop
mkdir /var/www
mkdir /var/www/magento2
mkdir /etc/magento/logs
chmod -R 777 /etc/magento/logs
echo "127.0.0.1 mage.ua" >> /etc/hosts
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled basic dependencies\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"