dnf update -y
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install python39 ansible -y
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-playbook install_oracle.yaml
