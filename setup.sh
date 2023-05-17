dnf update -y
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm --nogpgcheck
dnf install python39 ansible-core pexpect -y
dnf install python3-pip -y
python3 -m pip install ansible passlib
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-playbook 0_connect_hosts.yaml