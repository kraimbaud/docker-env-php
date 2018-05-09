.PHONY: build start php node nginx db certificate certbot certbot-renew

-include docker/.env
php-container?=php-fpm
nginx-container?=nginx
node-container?=node
db-container?=db

build:
	cd docker; bash up.sh
	cd docker; docker-compose build
	cd docker; docker-compose up -d

start:
	cd docker; docker-compose start

php:
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

node:
	docker exec -ti $(node-container)-$(PROJECT_NAME) bash

nginx:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) zsh

db:
	docker exec -ti $(db-container)-$(PROJECT_NAME) bash

# Generate Local Certificate for dev env
certificate:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt

# Generate Let's Encrypt Certificate for prod env
certbot:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) certbot certonly

# Renew Let's Encrypt Certificate
certbot-renew:
	docker exec $(nginx-container)-$(PROJECT_NAME) certbot renew
	docker restart $(nginx-container)-$(PROJECT_NAME)
