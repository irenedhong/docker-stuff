#!/usr/bin/env bash
mkdir /var/www/magento2/pub/static
cp auth.json /var/www/magento2/auth.json
cp auth.json /root/.composer/auth.json
cd /var/www/magento2 &&\
chown -R www-data /var/www/magento2 &&\
sudo -u www-data php bin/magento setup:install --backend-frontname=admin\
    --amqp-host=127.0.0.1\
    --amqp-user=guest\
    --amqp-password=guest\
    --amqp-port=5672\
    --db-host=127.0.0.1\
    --db-name=magento\
    --db-user=magento\
    --db-password=12345abc\
    --base-url=http://mage.ua\
    --timezone=America/Chicago\
    --use-rewrites=1\
    --admin-user=admin\
    --admin-password=12345abc\
    --admin-email=admin@test.com\
    --admin-firstname=admin\
    --admin-lastname=admin &&\
sudo -u www-data php bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=127.0.0.1 --cache-backend-redis-db=0 &&\
sudo -u www-data php bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=127.0.0.1 --page-cache-redis-db=1 &&\
sudo -u www-data php bin/magento setup:config:set --session-save=redis --session-save-redis-host=127.0.0.1 --session-save-redis-log-level=3 --session-save-redis-db=2 &&\
sudo -u www-data php bin/magento config:set admin/security/use_form_key 0 &&\
sudo -u www-data php bin/magento config:set cms/wysiwyg/enabled disabled &&\
sudo -u www-data php bin/magento config:set admin/security/admin_account_sharing 1 &&\
sudo -u www-data php bin/magento cache:flush
cp /etc/magento/resources/api-functional/install-config-mysql.php /var/www/magento2/dev/tests/api-functional/config/
mv /etc/magento/resources/api-functional/rest.xml dev/tests/api-functional/phpunit.xml
cp /etc/magento/system/resources/local_nginx.conf local_nginx.conf
service php7.2-fpm stop > /dev/null ||\
service php7.1-fpm stop > /dev/null
service php7.2-fpm start > /dev/null ||\
service php7.1-fpm start > /dev/null
service nginx restart > /dev/null ||\
service apache2 restart > /dev/null
service cron stop
service cron start
service cron restart