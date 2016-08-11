Docker for famous PHP frameworks & CMS
======================================

A Docker composer to bootstrap Symfony, Laravel and Wordpress projects. 

### Install and Run the environment
    
[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.
    
    ./up build
 
### Bootstrap a project

Bootstrap a Symfony project

    symfony new symfony-project

Bootstrap a Laravel project

    laravel new laravel-project

Bootstrap a Wordpress project

    git clone https://github.com/WordPress/WordPress.git wordpress-project

If you do change the project name, you will have to change Nginx configuration.

Browser web site

    # Use PHP with Apache
    http://localhost:8888 
       
    php bin/console server:start 0.0.0.0:8000

#### PhpMyAdmin

Browser the MySQL database with PhpMyAdmin:

    http://localhost:8080
    
Login: **root**, Password: **root**. (You can change this config in you docker-compose.yml file).
    

### SSH Config

Put in **docker/php/ssh** folder your ssh private and public key (Your _id_rsa_ and _id_rsa.pub_ files).

Those files are usually located in your **~/.ssh** folder.

To know how to generate a ssh key, 
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/).
