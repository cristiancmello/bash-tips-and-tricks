#!/bin/bash

DOCKER_CONTAINERS=$(docker ps -a -q)

if [[ -z $DOCKER_CONTAINERS ]]; then
  echo "Containers: nothing to stop"
else
  docker stop $DOCKER_CONTAINERS
fi

docker image prune -a --force
docker container prune --force
docker network prune --force
docker volume prune --force
docker system prune --volumes --force
