FROM php:7.1-fpm

# Right access
RUN usermod -u 1000 www-data

# Install Packages
RUN apt-get update && apt-get install -y \
    vim \
    nano \
    zsh \
    git \
    zlib1g-dev \
    libicu-dev \
    libexif-dev \
    wkhtmltopdf \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    httpie

RUN docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    zip \
    mbstring \
    bcmath \
    intl \
    opcache \
    calendar \
    pcntl \
    gd \
    iconv \
    mcrypt \
    exif

# Git config
RUN git config --global core.excludesfile '~/.gitignore_global'

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/wezm+/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+
RUN sed -i -- 's/plugins=(git)/plugins=(git symfony2)/g' ~/.zshrc # Add symfony2 plugin

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install the Symfony Installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# PHP Deployer
RUN curl -LO http://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep
RUN dep self-update

# PHP CS Fixer
RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v1.11.6/php-cs-fixer.phar -o php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer

# PHP Unit
RUN curl https://phar.phpunit.de/phpunit.phar -L -o phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash
RUN apt-get install -y nodejs

# Symbolic links for NodeJS
RUN ln -s /usr/bin/nodejs /usr/local/bin/node
RUN ln -s /usr/bin/npm /usr/local/bin/npm

# Install npm packages
RUN npm install -g gulp-cli
RUN npm install -g foundation-cli
RUN npm install -g @angular/cli

# Add some config
ADD php.ini /usr/local/etc/php/conf.d/
ADD vim/.vimrc /root
ADD git/.gitignore_global /root

# SSh Config
ADD ssh /root/.ssh
RUN if [ -f ~/.ssh/id_rsa ]; then chmod 600 ~/.ssh/id_rsa; fi
RUN if [ -f ~/.ssh/id_rsa.pub ]; then chmod 600 ~/.ssh/id_rsa.pub; fi

# ENTRYPOINT
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
