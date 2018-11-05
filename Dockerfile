FROM ubuntu:18.04
ARG php_ver=7.2
COPY install/basics.sh /etc/magento/system/install/
COPY install/nginx.sh /etc/magento/system/install/
COPY install/mysql.sh /etc/magento/system/install/
COPY install/php${php_ver}.sh /etc/magento/system/install/php.sh
COPY install/rabbitmq.sh /etc/magento/system/install/
COPY install/redis.sh /etc/magento/system/install/
COPY install/functional_tests_requirements.sh /etc/magento/system/install/
COPY install/mtf_requirements.sh /etc/magento/system/install/
COPY install/mftf_requirements.sh /etc/magento/system/install/
COPY install/finalize.sh /etc/magento/system/install/
COPY resources/magento2.conf /etc/magento/system/resources/
COPY init/init.sh /etc/magento/system/init/
COPY magento2_install /etc/magento/magento2/install/
COPY resources/mtf /etc/magento/resources/mtf/
COPY resources/mftf /etc/magento/resources/mftf/
COPY resources/crontab /etc/magento/system/resources/
EXPOSE 80 443 22
USER root
RUN /etc/magento/system/install/basics.sh
RUN /etc/magento/system/install/mysql.sh
RUN /etc/magento/system/install/php.sh
RUN /etc/magento/system/install/nginx.sh
RUN /etc/magento/system/install/rabbitmq.sh
RUN /etc/magento/system/install/redis.sh
RUN /etc/magento/system/install/functional_tests_requirements.sh
RUN /etc/magento/system/install/mtf_requirements.sh
RUN /etc/magento/system/install/mftf_requirements.sh
RUN /etc/magento/system/install/finalize.sh
CMD /etc/magento/system/init/init.sh && bin/bash