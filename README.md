Docker for Symfony
==================

A Docker composer to bootstrap Symfony project. 

### Install and Run the environment
    
[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.
    
    bash build
 
### Bootstrap a Symfony project

    symfony new symfony-project

Keep this folder name if you are lazy. 

If you do change the project name, you will have to change Nginx configuration.

### Hosts configuration

Edit your hosts file

    sudo vi /etc/hosts
    
Add those new hostname which target your docker-machine ip address

    192.168.99.100 site.dev
    192.168.99.100 www.site.dev
    192.168.99.100 site.prod
    192.168.99.100 www.site.prod
    
Go to the web site

    http://site.dev
    
#### PhpMyAdmin

To Browser PhpMyadmin:

    http://site.dev:8080
    
Login: root, Password: root. (You can change this config in you docker-compose.yml file)
    
### GIT Congiguration

Config your git name and email in the **docker/php/bootstrap.sh** file

### SSH Congiguration

Put in **docker/php/ssh** folder your ssh private and public key (Your _id_rsa_ and _id_rsa.pub_ files).

Those files are usually located in your **~/.ssh** folder.

To know how to generate a ssh key, 
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/)
