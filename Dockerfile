FROM ubuntu:14.04
MAINTAINER Mauricio Sanchez <msanchez@aplyca.com>
LABEL Description="MariaDB installed and configured using Ansible" Vendor="Aplyca" Version="0.9.1-001"


# Adding Ansible role
ADD . /tmp/aplyca.MariaDB
WORKDIR /tmp/aplyca.MariaDB/build

# Provision image
RUN ./provision.sh 

# Create mount points for volumes
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Expose MariaDB port
EXPOSE 3306

# Start MariaDB service
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]