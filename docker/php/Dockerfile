FROM php:7-fpm

# Install Packages
RUN apt-get update && apt-get install -y vim zsh git nodejs npm zlib1g-dev
RUN docker-php-ext-install pdo pdo_mysql zip mbstring

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/wezm+/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+

# Right access
RUN usermod -u 1000 www-data

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install Laravel Installer
RUN composer global require "laravel/installer"
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> /root/.zshrc

# Install the Symfony Installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Add Config
ADD php.ini /usr/local/etc/php/conf.d/
ADD vim/.vimrc /root
ADD git/.gitignore_global /root
ADD ssh /root/.ssh
ADD bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh
RUN /bootstrap.sh
