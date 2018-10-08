#!/usr/bin/env bash
service ssh restart
service mysql restart
service php7.2-fpm restart
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
service mysql restart
service rabbitmq-server restart
service cron restart
echo 'xdebug.remote_enable=On' >> /etc/php/7.2/mods-available/xdebug.ini
echo 'xdebug.remote_port=9000' >> /etc/php/7.2/mods-available/xdebug.ini
echo "xdebug.remote_host='host.docker.internal'" >> /etc/php/7.2/mods-available/xdebug.ini
echo 'xdebug.profiler_enable=On' >> /etc/php/7.2/mods-available/xdebug.ini
echo 'xdebug.idekey=PHPSTORM' >> /etc/php/7.2/mods-available/xdebug.ini
redis-server &>/dev/null & disown
Xvfb :11 -ac &>/etc/magento/logs/mtf_xvfb.log & disown
export DISPLAY=:11 && sudo -u selenium java -jar /etc/magento/resources/mtf/selenium2.53.1.jar &>/etc/magento/logs/mtf_selenium.log & disown
Xvfb :10 -ac &>/etc/magento/logs/mftf_xvfb.log & disown
export DISPLAY=:10 && sudo -u selenium java -jar /etc/magento/resources/mftf/selenium3.14.0.jar -port 44444 &>/etc/magento/logs/mftf_selenium.log & disown