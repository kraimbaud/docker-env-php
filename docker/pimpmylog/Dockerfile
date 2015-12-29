FROM php:7-apache

RUN apt-get update && apt-get install -y \
    git

RUN usermod -u 1000 www-data
RUN git clone https://github.com/potsky/PimpMyLog.git /var/www/html/pimpmylog
RUN chmod 777 /var/www/html/pimpmylog