.PHONY: build up exec generate-certificate

-include docker/.env
php-container?=php-fpm
nginx-container?=nginx
node-container?=node

build:
	cd docker; bash up.sh
	cd docker; docker-compose build
	cd docker; docker-compose up -d
#	docker exec $(app_container)-$(PROJECT_NAME) composer install -v --prefer-dist --no-suggest --no-interaction
#	docker exec $(app_container)-$(PROJECT_NAME) php bin/console do:sc:up -f
#	docker exec $(app_container)-$(PROJECT_NAME) php bin/console cache:clear --env=$(ENV)
#	docker exec $(node_container)-$(PROJECT_NAME) npm install
#	docker exec $(node_container)-$(PROJECT_NAME) ng build

up:
	cd docker; docker-compose up -d
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

exec:
	docker exec -ti $(php-container)-$(PROJECT_NAME) zsh

generate-certificate:
	docker exec -ti $(nginx-container)-$(PROJECT_NAME) certbot certonly
