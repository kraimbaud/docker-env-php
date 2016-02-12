#!/usr/bin/env bash

# Install Packages
apt-get update && apt-get install -y vim zsh git nodejs npm zlib1g-dev
docker-php-ext-install pdo pdo_mysql mysqli zip mbstring

# Instal Oh my Zsh
bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i -- 's/robbyrussell/wezm+/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+

# Right access
usermod -u 1000 www-data

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install Laravel Installer
composer global require "laravel/installer"
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> /root/.zshrc

# Install the Symfony Installer
curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony

git config --global core.excludesfile '~/.gitignore_global'
git config --global user.email "you@example.com"
git config --global user.name "Your Name"