#!/bin/bash
# test MatiaDB provisiones with ansible

cd $(dirname "$0")

echo "Checking syntax"
ansible-playbook playbook.yml --syntax-check

echo "Running role"
ansible-playbook playbook.yml --connection=local

echo "Checking idempotence"
ansible-playbook playbook.yml --connection=local | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)

echo "Running tests"
ansible-playbook tests.yml --connection=local
