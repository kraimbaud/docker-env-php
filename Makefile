.PHONY: build up start stop rm exec generate-certificate

include docker/.env
php-container?=php-fpm
nginx-container?=nginx
node-container?=node

build:
	cd docker; bash up.sh
	cd docker; docker-compose build
	cd docker; docker-compose up -d
	docker ps

up:
	cd docker; docker-compose up -d
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

start:
	cd docker; docker-compose start

stop:
	cd docker; docker-compose stop

rm: stop
	cd docker; docker-compose rm

exec:
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

generate-certificate:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) certbot certonly
