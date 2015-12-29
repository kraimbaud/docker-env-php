Docker Symfony Ship
=====================

A Docker Image to bootstrap Symfony project. 
You will have to [Install Docker](http://docs.docker.com/engine/installation/) first to use this environment

### Install and Run the environment

    docker-compose up -d

### Bootstrap a Symfony project

    symfony new symfony_project

### Hosts conviguration

Edit your hosts file

    sudo vim /etc/hosts
    
Add those new hostname which target your docker machine ip address

    192.168.99.100 site.dev
    192.168.99.100 www.site.dev
    192.168.99.100 site.preprod
    192.168.99.100 www.site.preprod
    192.168.99.100 site.prod
    192.168.99.100 www.site.prod