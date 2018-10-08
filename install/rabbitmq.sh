#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling RabbitMQ\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
apt install -yf rabbitmq-server
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled RabbitMQ\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"