Your new Personal Docker Env
============================

### Install and Run the environment

[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.

    make build

Edit env variable in **docker/.env**

    PROJECT_NAME=melody
    ENV=dev
    USER=admin # Important, Change it. echo $USERNAME 
    GIT_EMAIL=my.email@domain.name
    GIT_NAME=My Name

### Make some code

    make php # Enter into the PHP docker container
    make node # Enter into the Node docker container

### Config hosts file

Replace **local** with your project name in your .env file
 
    127.0.0.1 index.local traefik.local php.local node.local db.local phpmyadmin.local portainer.local

Browser http://index.local to check if php is working

### Configure Nginx `/docker/nginx/conf.d/`
Copy `_index.conf`

`cp _index.conf your_project_name.conf`

Restart nginx container after modification

#### PhpMyAdmin

Browser the MySQL database with PhpMyAdmin: http://phpmyadmin.local

Login: **root**, Password: **root**. (You can change this config in you `.env` file).

### SSH Config

Add the ssh config to your container and rebuild the project

     cp ~/.ssh/* $(pwd)/docker/_config/ssh
     make build

To know how to generate a ssh key,
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/).

### SSL Certificate

    make certificate # Generate SSL Certificate for DEV
    make certbot     # Generate Let's Encrypt SSL Certificate for PROD
