#!/usr/bin/env bash

todo=${1-up}

remove_containers () {
    docker stop $(docker ps -a -q)
    docker rm php-fpm-melody
    docker rm phpmyadmin-melody
    docker rm mysql-melody
    docker rm nginx-melody
}

up () {
    docker-compose up -d
    docker exec -ti php-fpm zsh
}

if [ $todo = "build" ]; then

    file='docker.env'
    gitName="$(git config --global user.name)"
    gitEmail="$(git config --global user.email)"

    if [ -a $file ]; then
       echo "$file file exists."
    else
       echo "$file file does not exist."
       touch $file
       echo "gitEmail=\"$gitEmail\"" >> $file
       echo "gitName=\"$gitName\"" >> $file
       echo "$file file has been created"
    fi

    docker-compose build
    remove_containers
    up

elif [ $todo = "rm" ]; then
    echo 'Remove containers'
    remove_containers
    exit

elif [ $todo = "up" ]; then
    up
else
    echo 'Parameter not found'
    exit
fi
