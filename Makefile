.PHONY: build up start stop rm exec generate-certificate

php-container?=php-fpm-melody
nginx-container?=nginx-melody
node-container?=node-melody
env?=dev

build:
	cd docker; bash up.sh
	cd docker; docker-compose build
	cd docker; docker-compose up -d
	docker ps

up:
	cd docker; docker-compose up -d
	docker exec -ti $(php-container) zsh

start:
	cd docker; docker-compose start

stop:
	cd docker; docker-compose stop

rm: stop
	cd docker; docker-compose rm

exec:
	docker exec -ti $(php-container) zsh

generate-certificate:
	docker exec -ti $(nginx-container) certbot certonly
