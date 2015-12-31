FROM php:7-fpm

# Install Packages
RUN apt-get update && apt-get install -y vim zsh git nodejs npm zlib1g-dev
RUN docker-php-ext-install pdo pdo_mysql zip mbstring

# Right access
RUN usermod -u 1000 www-data

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install the Symfony Installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Config php.ini
ADD php.ini /usr/local/etc/php/conf.d/

# Config Vim
ADD .vimrc /root

# Config Git
ADD .gitignore_global /root
RUN git config --global core.excludesfile '~/.gitignore_global'

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
