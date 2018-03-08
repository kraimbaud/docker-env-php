.PHONY: build start exec php node nginx install exec certificate certbot

-include docker/.env
php-container?=php-fpm
nginx-container?=nginx
node-container?=node

build:
	cd docker; bash up.sh
	cd docker; docker-compose build
	cd docker; docker-compose up -d
	docker exec -ti nginx-melody zsh

start:
	cd docker; docker-compose start

exec:
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

php:
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

node:
	docker exec -ti $(node-container)-$(PROJECT_NAME) bash

nginx:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) zsh

# Generate Local Certificate for dev env
certificate:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt

# Generate Let's Encrypt Certificate for prod env
certbot:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) certbot certonly

# Renew Let's Encrypt Certificate
certbot-renew:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) certbot renew
	docker restart $(nginx-container)-$(PROJECT_NAME)

#install:
#	docker exec $(php-container)-$(PROJECT_NAME) composer install -v --prefer-dist --no-suggest --no-interaction
#	docker exec $(php-container)-$(PROJECT_NAME) php bin/console do:sc:up -f
#	docker exec $(php-container)-$(PROJECT_NAME) php bin/console cache:clear --env=$(ENV)
#	docker exec $(node-container)-$(PROJECT_NAME) npm install
#	docker exec $(node-container)-$(PROJECT_NAME) ng build