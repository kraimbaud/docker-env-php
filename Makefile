.PHONY: build up start stop rm exec install

container?=php-fpm-melody
env?=dev

build:
	cd docker; docker-compose build
	cd docker; docker-compose up -d
	docker ps
	docker exec -ti $(container) zsh

up:
	cd docker; ./up

start:
	cd docker; docker-compose start

stop:
	cd docker; docker-compose stop

rm: stop
	cd docker; docker-compose rm

exec:
	docker exec -ti $(container) zsh
