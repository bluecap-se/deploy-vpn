#!/bin/bash

# Destroy Droplet instance and firewall
ansible-playbook -i inventory/production playbooks/remove-instance.yml --extra-vars="ansible_python_interpreter=$(which python3)"

echo "Resetting hosts file"
cp inventory/production/example.hosts inventory/production/hosts
