#!/usr/bin/env bash

container="symfony"

docker-compose build
docker rm -f "$container"
docker-compose up -d
docker exec -ti "$container" bash
