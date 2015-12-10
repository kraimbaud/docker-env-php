FROM php:7-apache

# apt-get command
RUN apt-get update && apt-get install -y \
    vim \
    git \
    nodejs
RUN apt-get install -y zlib1g-dev && docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install the Symfony Installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Create the php.ini file
RUN cp /usr/src/php/php.ini-development /usr/local/etc/php/php.ini



