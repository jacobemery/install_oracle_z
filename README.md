# install_oracle_z
Ansible-automated install of Oracle Database and Oracle Automatic Storage Management (ASM) on Red Hat Enterprise Linux (RHEL) for IBM zSystems.

# Description:
This playbook automates the configuration of servers for Oracle Database installation. It performs tasks such as installing necessary dependencies, creating required user groups and users, setting up directories, applying essential system configurations, installing Oracle Database and creating an instance. Additionally, it includes optional tasks for Oracle Automatic Storage Management (ASM) setup and configuration, such as DASD setup and post-installation verifications. The playbook streamlines the process of preparing servers for Oracle Database deployment while ensuring all prerequisites are met.

## Pre-requisites:
- Root shell to RHEL>=v8 on IBM zSystems.
- RPM packages for Oracle Database and ASM for s390x architecture from the [Oracle Software Delivery Cloud](https://edelivery.oracle.com/) downloaded to your server.
- Minumum of 2GB RAM and 10GB (+16GB if using ASM) of disk space.

## Instructions:
Complete the following steps to setup your Ansible Controller, which will manage your database servers. Written and tested for RHEL server:
### 1. Install git
```
sudo dnf install git
```
### 2. Clone this repository
```
git clone https://github.com/jacobemery/install_oracle_z.git
```
### 3. Change into directory.
```
cd oracle_install
```
### 4. Set variables
  - Ensure all variables in `inventory.yaml` are correct for your environment.
  - Add IP addresses / fully-qualified domain names to inventory for each DB server to be setup. Can add as many as you'd like.
  - Double-check `asm_disk_ccw` if using ASM. This must be the Channel Command Word of the disk to be used for ASM.
```
vi inventory.yaml
```
  - Set passwords in vault.yaml where there are `#X`s.
```
vi group_vars/db_servers/vault.yaml
```
### 5. Setup Ansible Vault
- Create a vault password. Make sure to replace `vault-password` with your desired password. 
- This command also sets the permissions so that only you can read/write the file.
```
echo 'vault-password' > .password.txt && chmod 600 .password.txt
```
- Encrypt the vault.
```
ansible-vault encrypt group_vars/db_servers/vault.yaml
```
- For more on using Ansible Vault, see the [official documentation](https://docs.ansible.com/ansible/2.8/user_guide/vault.html).
### 6. Run the setup script (for RHEL server):
```
./setup.sh
```
### 7. Run the playbooks.
If you do not already have SSH connection setup from your Ansible Controller to DB servers (or to test/remedy connection):
```
ansible-playbook 0_connect_hosts.yaml
```
Setup server for Oracle software:
```
ansible-playbook 1_oracle_prep.yaml
```
(Optional) install Oracle Automatic Storage Manager (ASM):
```
ansible-playbook 2_asm_install.yaml
```
Install Oracle Database:
```
ansible-playbook 3_oracledb_install.yaml
```
Alternatively, setup and run the playbook all at once. <b>Note</b>: not recommended for first-time users.
```
./setup_and_run.sh
```
