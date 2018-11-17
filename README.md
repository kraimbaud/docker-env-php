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

### Make some PHP

    make php # Enter into the PHP docker container
    
### Make some Node

    make node # Enter into the Node docker container

### Configure Nginx `/docker/nginx/conf.d/`
Copy `default.conf`

`cp default.conf your_project_name.conf`

Restart nginx container after modification

#### PhpMyAdmin

Browser the MySQL database with PhpMyAdmin:

    http://localhost:8888

Login: **root**, Password: **root**. (You can change this config in you `.env` file).

### SSH Config

Add the ssh config to your container and rebuild the project

     cp ~/.ssh/* $(pwd)/docker/_config/ssh
     sudo make build
     eval $(ssh-agent)  // Started the SSH agent
     ssh-add            // Add your private key to it

To know how to generate a ssh key,
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/).

### SSL Certificate

    make certificate # Generate SSL Certificate for DEV
    make certbot     # Generate Let's Encrypt SSL Certificate for PROD
