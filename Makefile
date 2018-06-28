.PHONY: build build-prod start php node nginx db certificate certbot certbot-renew

-include docker/.env
php-container?=php-fpm
nginx-container?=nginx
node-container?=node
db-container?=db

build:
	cd docker; bash up.sh
	cd docker; docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build

build-prod:
	cd docker; bash up.sh
	cd docker; docker-compose up -d --build --remove-orphans

start:
	cd docker; docker-compose -f docker-compose.dev.yml start

start-prod:
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
