.PHONY: build up start stop rm

build:
	cd docker; ./up build

up:
	cd docker; ./up

start:
	cd docker; docker-compose start

stop:
	cd docker; docker-compose stop

rm:
	cd docker; docker-compose rm