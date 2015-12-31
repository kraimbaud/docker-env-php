Docker for Symfony
==================

A Docker Image to bootstrap Symfony project. 
You will have to [Install Docker](http://docs.docker.com/engine/installation/) first to use this environment

### Install and Run the environment

    docker-compose up -d

If you are in a UNIX environment a bash script is available.

So every time you want to rebuild your environment you can just do:

    bash up
 
### Bootstrap a Symfony project

    symfony new symfony-project

Keep this folder name if you are lazy. 

If you do change the project name, you will have to change Nginx configuration.

### Hosts configuration

Edit your hosts file

    sudo vim /etc/hosts
    
Add those new hostnames which target your docker-machine ip address

    192.168.99.100 site.dev
    192.168.99.100 www.site.dev
    192.168.99.100 site.prod
    192.168.99.100 www.site.prod
    
#### PhpMyAdmin

To Browser PhpMyadmin:

    http://<hostname>:8080
    
Login: root, Password: root. (You can change this config in you docker-compose.yml file)
    