Docker for famous PHP frameworks
================================

A Docker composer to bootstrap Symfony ans Laravel projects. 

### Install and Run the environment
    
[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.
    
    ./build
 
### Bootstrap a project

Bootstrap a Symfony project

    symfony new symfony-project

If you do change the project name, you will have to change Nginx configuration.

Bootstrap a Laravel project

    laravel new laravel-project

If you do change the project name, you will have to change Nginx configuration.

### Hosts Config

Edit your hosts file

    sudo vi /etc/hosts
    
Add those new hostname which target your docker-machine ip address

    192.168.99.100 symfony.dev
    192.168.99.100 laravel.dev
    
Browser web site

    http://symfony.dev
    http://laravel.dev
    
#### PhpMyAdmin

Browser the MySQL database with PhpMyAdmin:

    http://<your_chosen_hostname>:8080
    
Login: **root**, Password: **root**. (You can change this config in you docker-compose.yml file).
    
### Git Config

Config your git name and email in the **docker/php/bootstrap.sh** file.

    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"

If you want to ignore some files globally, add them in **docker/php/git/.gitignore**.
Rebuild the image after this modification.

    *~
    .DS_Store
    .idea/*

### SSH Config

Put in **docker/php/ssh** folder your ssh private and public key (Your _id_rsa_ and _id_rsa.pub_ files).

Those files are usually located in your **~/.ssh** folder.

To know how to generate a ssh key, 
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/).
