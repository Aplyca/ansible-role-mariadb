FROM ubuntu:14.04
MAINTAINER Mauricio Sanchez <msanchez@aplyca.com>
LABEL Description="MariaDB installed and configured using Ansible" Vendor="Aplyca" Version="0.9.1-001"


# Adding Ansible role
ADD . /tmp/aplyca.MariaDB
WORKDIR /tmp/aplyca.MariaDB/build

# Provision image
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    ansible-playbook playbook.yml --connection=local --extra-vars "@settings.yml" && \
    apt-get -y remove --purge software-properties-common && \
    apt-get -y remove --purge ansible && \
    apt-get -y autoremove && \    
    apt-get -y clean

# Create mount points for volumes
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Expose MariaDB port
EXPOSE 3306

# Start MariaDB service
ENTRYPOINT ["mysqld"]