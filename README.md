# oracle_install_z
Ansible-automated install of Oracle Database and Oracle Automatic Storage Management (ASM) on Red Hat Enterprise Linux (RHEL) for IBM zSystems.

## Instructions:
From your RHEL server as root, complete the following steps:
### 1. Install git
```
dnf install git
```
### 2. Clone this repository
```
git clone https://github.com/jacobemery/oracle_install.git
```
### 3. Change into directory.
```
cd oracle_install
```
### 4. Set variables
  - Set the IP addresses of the DB server in inventory.yaml where there is a `#X`
  - Ensure all other variables are correct for your environment.
  - Look through the install_oracle.yaml playbook to ensure it meets your needs.
```
vi inventory.yaml
```
  - Set Oracle DB server(s) root password and oracle user's passwords in vault.yaml where there are `#X`s.
```
vi group_vars/dbservers/vault.yaml
```
### 5. Setup Ansible Vault
- Create a vault password. Make sure to replace `<vault-password>` with your desired password.
```
echo <vault-password> > .password.txt
```
- Encrypt the vault.
```
ansible-vault encrypt group_vars/dbservers/vault.yaml
```
- For more on using Ansible Vault, see the [official documentation](https://docs.ansible.com/ansible/2.8/user_guide/vault.html).
### 6. Run the setup script
```
./setup.sh
```
### 7. Run the playbook.
```
ansible-playbook install_oracle.yaml
```
Alternatively, setup and run the playbook all at once. <b>Note</b>: not recommended for first-time users.
```
./setup_and_run.sh
```