#!/bin/bash
# test MatiaDB provisiones with ansible

cd $(dirname "$0")

vagrant destroy -f

echo "Starting VM"
vagrant up --no-provision

echo "Running role"
vagrant provision

echo "Running tests"
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tests.yml -u vagrant