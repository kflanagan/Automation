Proxmox LXC management (Ansible)
================================

Overview
--------
This folder contains minimal playbooks to enumerate LXC containers on a Proxmox host, restart containers, and perform package updates inside containers.

Quick start
-----------
1. Install required collections:

```bash
ansible-galaxy collection install -r requirements.yml
```

2. Populate and encrypt API credentials:

```bash
# Edit group_vars/proxmox/vault.yml and set pve_token_secret etc.
ansible-vault encrypt group_vars/proxmox/vault.yml
```

3. Dry-run an update for all containers:

```bash
ansible-playbook playbooks/proxmox_update_lxc.yaml -e "dry_run=true"
```

4. Restart a container (example vmid 102):

```bash
ansible-playbook playbooks/proxmox_restart_lxc.yaml -e "target_vms=[102]"
```

Notes & assumptions
- Playbooks use the `community.proxmox` collection to query the Proxmox API.
- Updating packages inside containers uses `pct exec` executed on the Proxmox host via SSH. Ensure the controller can SSH to the Proxmox host as `proxmox_ssh_user` (default `root`).
- The `group_vars/proxmox/vault.yml` file must be encrypted with `ansible-vault` to protect secrets.
