Docker for Symfony
==================

A Docker composer to bootstrap Symfony project. 

### Install and Run the environment
    
[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.
    
    ./build
 
### Bootstrap a Symfony project

    symfony new symfony-project

Keep this folder name if you are lazy. 

If you do change the project name, you will have to change Nginx configuration.

### Hosts Config

Edit your hosts file

    sudo vi /etc/hosts
    
Add those new hostname which target your docker-machine ip address

    192.168.99.100 site.dev
    192.168.99.100 www.site.dev
    192.168.99.100 site.prod
    192.168.99.100 www.site.prod
    
Browser web site

    http://site.dev
    
#### PhpMyAdmin

To Browser PhpMyadmin:

    http://site.dev:8080
    
Login: root, Password: root. (You can change this config in you docker-compose.yml file).
    
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
