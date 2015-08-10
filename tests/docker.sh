#!/bin/bash
# test MatiaDB provisiones with ansible

ANSIBLE_ROLE="aplyca.MariaDB"
DOCKER_IMAGE="ansible/ubuntu14.04-ansible"

docker run -it --name test-mariadb -v `pwd`:/tmp/${ANSIBLE_ROLE} ${DOCKER_IMAGE} /tmp/${ANSIBLE_ROLE}/tests/tests.sh
docker stop test-mariadb && docker rm test-mariadb