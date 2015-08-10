#!/bin/bash
# Provision MariaDB with ansible

DEBIAN_FRONTEND=noninteractive 
apt-get -y install software-properties-common &&
apt-add-repository -y ppa:ansible/ansible &&
apt-get update &&
apt-get install -y ansible &&

ansible-playbook playbook.yml --connection=local --extra-vars "@settings.yml" &&

apt-get -y remove --purge software-properties-common
apt-get -y remove --purge ansible
apt-get -y autoremove
apt-get -y clean