FROM ansible/ubuntu14.04-ansible
MAINTAINER Mauricio Sanchez <msanchez@aplyca.com>
LABEL Description="MariaDB installed and configured using Ansible" Vendor="Aplyca" Version="0.9.1-001"

ADD . /tmp/aplyca.MariaDB
WORKDIR /tmp/aplyca.MariaDB/tests

RUN ./tests.sh