#!/bin/bash
# Build MariaDB provisiones with ansible

DOCKER_IMAGE="aplyca/mariadb"

cd $(dirname "$0") && cd ..

echo "Building image"
docker build -t ${DOCKER_IMAGE} .

echo "Stopping and removing running db containers"
docker stop db && docker rm db

echo "Starting new db container"
docker run -d --name db -p 3306:3306 aplyca/mariadb