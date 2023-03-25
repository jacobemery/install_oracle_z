# oracle_install
Automated install of Oracle DB on Red Hat Enterprise Linux on IBM zSystems.

## Instructions:
On your workstation, complete the following steps to install Oracle DB on RHEL servers on IBM zSystems:
1. Install git
```
sudo dnf install git
```
2. Clone this repository
```
git clone https://github.com/jacobemery/oracle_install.git
```
3. Change into directory.
```
cd oracle_install
```
4. Set variables
  - Set Oracle DB server(s) root password and oracle user's passwords in vault.yaml
  - Set the IP addresses of the DB servers to connect to in inventory under dbserver.hosts.
  - Ensure all other variables are correct for your environment.
  - Look through the install_oracle.yaml playbook to ensure playbook meets your specifications.
4. If your executing Ansible from a RHEL server, run setup.sh to install Ansible, Python3 and Ansible Galaxy collections. Otherwise, this must be done manually - see setup.sh for details.
```
./setup.sh
```
Alternatively, if you'd like to do the setup tasks and run the playbook all at once:
```
./setup_and_run.sh
```
Then you can skip the next two steps.
7. Install Ansible Galaxy dependencies.
```
ansible-galaxy install -r requirements.yaml
```
8. Run the playbook.
```
ansible-playbook install_oracle.yaml
```

## Using Ansible Vault
To protect your passwords, use the Ansible Vault. Here are some helpful commands and tips:
- After adding the required passwords to vault.yaml, to encrypt it use:
```
ansible-vault encrypt vault.yaml
```
- Then in order to use the playbooks, you must add `--ask-vault-pass` so that it prompts you for the vault password before executing the playbook, for example:
```
ansible-playbook install_oracle.yaml --ask-vault-pass
```
- To view vault.yaml:
```
ansible-vault view vault.yaml
```
- To edit vault.yaml
```
ansible-vault view vault.yaml
```
- To decrypt vault.yaml
ansible-vault decrypt vault.yaml