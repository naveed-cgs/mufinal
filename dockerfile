#FROM ubuntu:latest
FROM php:7.2.2-apache

#RUN apt-get install php7.0 php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-xml
#apt-get install php
# Enable apache mods.
#RUN a2enmod php7.2.2
RUN a2enmod rewrite
RUN a2enmod headers
RUN docker-php-ext-install pdo_mysql

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ADD ./happytrigger /home/cgsadmin/happytrigger
