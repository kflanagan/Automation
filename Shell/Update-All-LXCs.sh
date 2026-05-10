#!/bin/bash
set -euo pipefail

# Update all LXC containers on the Proxmox host
# This script lists all LXC containers, extracts their IDs, and runs the update and upgrade commands inside each container.
# To be used, run this script on the Proxmox host. It will automatically update and upgrade all LXC containers.
#

if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run as root." >&2
  exit 1
fi

if ! command -v pct >/dev/null 2>&1; then
  echo "Error: pct is not available. Are you on a Proxmox host?" >&2
  exit 1
fi

if [[ ! -d /etc/pve ]]; then
  echo "Error: /etc/pve not found. This does not appear to be a Proxmox host." >&2
  exit 1
fi

LOG_FILE=/var/log/update-all-lxcs.log
exec > >(tee -a "$LOG_FILE") 2>&1

echo "===== $(date '+%Y-%m-%d %H:%M:%S') - Starting LXC update run ====="
echo "Updating all LXC containers..."
pct list | tail -n +2 | while read line; do
  CTID=$(echo "$line" | awk '{print $1}')
  NAME=$(echo "$line" | awk '{print $2}')
  echo "======================== Updating container $CTID: $NAME ========================"
  if ! pct exec $CTID -- bash -c "apt update && apt upgrade -y && apt autoremove -y"; then
    echo "ERROR: Container $CTID ($NAME) failed to update. Continuing with next container."
  fi
done
echo "===== $(date '+%Y-%m-%d %H:%M:%S') - LXC update run complete ====="