.PHONY: build up start stop rm exec

APP_CONTAINER?=php-fpm-melody

build:
	cd docker; ./up build

up:
	cd docker; ./up

start:
	cd docker; docker-compose start

stop:
	cd docker; docker-compose stop

rm: stop
	cd docker; docker-compose rm

exec:
	docker exec -ti $(APP_CONTAINER) zsh
