A Docker PHP Env
================

### Install and Run the environment

[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.

    make build

### Bootstrap a project

Bootstrap a Symfony project

    composer create-project symfony/skeleton my_project

Browser web site

    cd my_project
    php -S 0.0.0.0:8000 -t public

#### PhpMyAdmin

Browser the MySQL database with PhpMyAdmin:

    http://localhost:8080

Login: **admin**, Password: **admin**. (You can change this config in you docker-compose.yml file).

### SSH Config

Add the ssh config to your container and rebuild the project

     cp ~/.ssh/* $(pwd)/docker/php/ssh
     make build
     eval $(ssh-agent)  // Started the SSH agent
     ssh-add            // Add your private key to it

To know how to generate a ssh key,
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/).

### Generate SSL Certificate

    make generate-certificate
    