#!/bin/bash

# Create Droplet instance
ansible-playbook -i inventory/production playbooks/create-instance.yml #--extra-vars="ansible_python_interpreter=python3"

echo "Updating IP address..."
IP=$(doctl compute droplet list --format PublicIPv4 --no-header)
sed -i '' "s/CHANGE/$IP/g" inventory/production/hosts

# Wait for instance to finish
echo "Waiting for instance to finish creating..."
sleep 60s

ansible-playbook -i inventory/production playbooks/pre-deploy.yml -e ansible_port=22

# Install OpenVPN
ansible-playbook -i inventory/production playbooks/playbook.yml

# Download VPN config
scp -P69 root@$IP:/root/client.ovpn .
