#!/bin/bash
# Build MariaDB provisiones with ansible

DOCKER_IMAGE="aplyca/mariadb"

echo "Building image"
docker build -t ${DOCKER_IMAGE} .

echo "Stopping and removing running db containers"
docker stop mariadb && docker rm mariadb

echo "Starting new db container"
docker run -d --name mariadb -p 3306:3306 aplyca/mariadb