sudo dnf install ansible python3 -y
ansible-galaxy install -r requirements.yaml
ansible-playbook install_oracle.yaml
