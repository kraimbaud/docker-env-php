FROM php:7-fpm

# Right access
RUN usermod -u 1000 www-data

# Env variables
ENV gitEmail="your@email.example"
ENV gitName="Your name"

# Install Packages
RUN apt-get update && apt-get install -y vim zsh git zlib1g-dev
RUN docker-php-ext-install pdo pdo_mysql mysqli zip mbstring

RUN git config --global core.excludesfile '~/.gitignore_global'
RUN git config --global user.email "${gitEmail}"
RUN git config --global user.name "${gitName}"

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/wezm+/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install Laravel Installer
RUN composer global require "laravel/installer"
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> /root/.zshrc

# Install the Symfony Installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

#NodeJS Lib
RUN apt-get install -y nodejs nodejs-legacy npm
RUN npm install -g bower
RUN npm install -g gulp-cli
RUN npm install -g grunt-cli
RUN npm install -g ungit
RUN npm install -g express-generator

# Add Config
ADD php.ini /usr/local/etc/php/conf.d/
ADD vim/.vimrc /root
ADD git/.gitignore_global /root
ADD ssh /root/.ssh
ADD ssh /root/.ssh
RUN chmod 600 ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa.pub
ADD command.sh /command.sh
