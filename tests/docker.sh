#!/bin/bash
# test MatiaDB provisiones with ansible

ANSIBLE_ROLE="aplyca.MariaDB"
DOCKER_IMAGE="ansible/ubuntu14.04-ansible"

cd $(dirname "$0") && cd ..

docker run -it -v `pwd`:/tmp/${ANSIBLE_ROLE} ${DOCKER_IMAGE} /tmp/${ANSIBLE_ROLE}/tests/tests.sh
