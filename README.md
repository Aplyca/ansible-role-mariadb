# Ansible Role: MariaDB

[![Build Status](https://travis-ci.org/Aplyca/ansible-role-mariadb.svg?branch=master)](https://travis-ci.org/Aplyca/ansible-role-mariadb)
[![Circle CI](https://circleci.com/gh/Aplyca/ansible-role-mariadb.svg?style=svg)](https://circleci.com/gh/Aplyca/ansible-role-mariadb)

Ansible Role that installs an configure MariaDB on Debian/Ubuntu.

## Requirements

Use hash behavior for variables in ansible.cfg
See example: https://github.com/Aplyca/ansible-role-mysql/blob/master/tests/ansible.cfg
See official docs: http://docs.ansible.com/intro_configuration.html#hash-behaviour

## Installation

Using ansible galaxy:
```bash
ansible-galaxy install aplyca.MariaDB
```
You can add this role as a dependency for other roles, add the role to the meta/main.yml file of your own role:
```yaml
dependencies:
  - { role: aplyca.MariaDB }
```

## Role Variables

See default variables: https://github.com/Aplyca/ansible-role-mariadb/blob/master/defaults/main.yml

## Dependencies

None.

## Testing

Use Vagrant to test the role:

```bash
cd tests;
vagrant up;
```
You should see a MariaDB server on localhost:3306

## License

MIT / BSD

## Author Information

Mauricio Sánchez from Aplyca SAS (http://www.aplyca.com)