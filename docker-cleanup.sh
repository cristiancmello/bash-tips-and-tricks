#!/bin/bash

# Stop/remove all containers
docker stop $(docker ps -a -q)
docker rm -f $(docker ps -a -q)

# Remove containers using more than one filter
docker rm -f $(docker ps -a -f status=exited -f status=created -q)

# Remove dangling volumes
docker volume rm -f $(docker volume ls -f dangling=true -q)

# Remove Dangling images
docker rmi -f $(docker images -f dangling=true -q)

# Remove all images
docker rmi -f $(docker images -a -q)

