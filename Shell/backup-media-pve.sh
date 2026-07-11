#!/usr/bin/env bash
set -euo pipefail

# Configuration
DEVICE="/dev/sdd1"
MOUNT_POINT="/mnt/backup_disk"
SOURCE_DIR="/data/plex"
TARGET_DIR="${MOUNT_POINT}/data/plex"
RSYNC_OPTIONS="-a --ignore-existing --info=progress2"
LOG_FILE="/var/log/backup-media-pve.log"

mkdir -p "${MOUNT_POINT}"
mkdir -p "${TARGET_DIR}"

if ! mountpoint -q "${MOUNT_POINT}"; then
  mount "${DEVICE}" "${MOUNT_POINT}"
  df -h "${MOUNT_POINT}"
fi

if [[ ! -d "${SOURCE_DIR}" ]]; then
  echo "Source directory does not exist: ${SOURCE_DIR}"
  exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Starting backup from ${SOURCE_DIR} to ${TARGET_DIR}" | tee -a "${LOG_FILE}"
rsync ${RSYNC_OPTIONS} "${SOURCE_DIR%/}/" "${TARGET_DIR%/}/" | tee -a "${LOG_FILE}"
echo "$(date '+%Y-%m-%d %H:%M:%S') Backup completed" | tee -a "${LOG_FILE}"

if [[  -d "${TARGET_DIR}" ]]; then
  umount "${MOUNT_POINT}"
else
  echo "Error: Target directory does not exist after backup: ${TARGET_DIR}" | tee -a "${LOG_FILE}"
  echo "Backup failed, not unmounting ${MOUNT_POINT}" | tee -a "${LOG_FILE}"    
  exit 1
fi
echo "$(date '+%Y-%m-%d %H:%M:%S') backup disk unmounted" | tee -a "${LOG_FILE}"



# "ssh -i config/.ssh/id_rsa -o StrictHostKeyChecking=no root@192.168.1.113 '/root/backup-media-pve.sh'"

