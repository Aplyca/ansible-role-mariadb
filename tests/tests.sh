#!/bin/bash
# test MatiaDB provisiones with ansible

cd $(dirname "$0") && cd ..

echo "Checking syntax"

ansible-playbook -i build/inventory build/playbook.yml --connection=local --syntax-check

echo "Running role"
ansible-playbook -i build/inventory build/playbook.yml --connection=local

echo "Checking idempotence"
ansible-playbook -i build/inventory build/playbook.yml --connection=local | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)

echo "Running tests"
ansible-playbook -i build/inventory tests/playbook.yml --connection=local
