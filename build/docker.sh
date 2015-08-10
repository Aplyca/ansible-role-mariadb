#!/bin/bash
# Build MariaDB provisiones with ansible

DOCKER_IMAGE="aplyca/mariadb"

cd $(dirname "$0") && cd ..

docker build -t ${DOCKER_IMAGE} .
docker stop db && docker rm db
docker run -d --name db -p 3306:3306 aplyca/mariadb