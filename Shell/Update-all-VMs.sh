#!/bin/bash
set -euo pipefail

# Update all VMs on the Proxmox host
# This script lists all VMs, detects their package manager (apt or dnf), and runs the appropriate update commands.
# To be used, run this script on the Proxmox host. It will automatically update and upgrade all VMs.
#

if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run as root." >&2
  exit 1
fi

if ! command -v qm >/dev/null 2>&1; then
  echo "Error: qm is not available. Are you on a Proxmox host?" >&2
  exit 1
fi

if [[ ! -d /etc/pve ]]; then
  echo "Error: /etc/pve not found. This does not appear to be a Proxmox host." >&2
  exit 1
fi

LOG_FILE=/var/log/update-all-vms.log
exec > >(tee -a "$LOG_FILE") 2>&1

echo "===== $(date '+%Y-%m-%d %H:%M:%S') - Starting VM update run ====="
echo "Updating all VMs..."

qm list | tail -n +2 | while read line; do
  VMID=$(echo "$line" | awk '{print $1}')
  NAME=$(echo "$line" | awk '{print $2}')
  
  # Skip haos VM
  if [[ "$NAME" == "haos" ]]; then
    echo "Skipping VM $VMID ($NAME) - explicitly excluded."
    continue
  fi
  
  echo "======================== Updating VM $VMID: $NAME ========================"
  
  # Check if VM is running
  STATUS=$(qm status $VMID | awk '{print $2}')
  if [[ "$STATUS" != "running" ]]; then
    echo "WARNING: VM $VMID ($NAME) is not running (status: $STATUS). Skipping."
    continue
  fi
  
  # Try to detect package manager and update
  if qm guest exec $VMID -- bash -c "which apt >/dev/null 2>&1"; then
    # Use apt for Debian/Ubuntu
    if ! qm guest exec $VMID -- bash -c "apt update && apt upgrade -y && apt autoremove -y"; then
      echo "ERROR: VM $VMID ($NAME) failed to update with apt. Continuing with next VM."
    fi
  elif qm guest exec $VMID -- bash -c "which dnf >/dev/null 2>&1"; then
    # Try dnf for RHEL/CentOS/Fedora
    if ! qm guest exec $VMID -- bash -c "dnf update -y && dnf upgrade -y"; then
      echo "ERROR: VM $VMID ($NAME) failed to update with dnf. Continuing with next VM."
    fi
  else
    echo "WARNING: VM $VMID ($NAME) has neither apt nor dnf. Skipping."
  fi
done

echo "===== $(date '+%Y-%m-%d %H:%M:%S') - VM update run complete ====="
