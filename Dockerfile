FROM ansible/ubuntu14.04-ansible
MAINTAINER Mauricio Sanchez <msanchez@aplyca.com>
LABEL Description="MariaDB installed and configured using Ansible" Vendor="Aplyca" Version="0.9.1-001"

ADD . /tmp/aplyca.MariaDB
WORKDIR /tmp/aplyca.MariaDB/build

RUN ansible-playbook playbook.yml --connection=local --extra-vars "@settings.yml"

RUN rm -rf /tmp/aplyca.MariaDB

VOLUME ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["mysqld"]