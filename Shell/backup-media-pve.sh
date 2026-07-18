#!/usr/bin/env bash
set -euo pipefail

# Configuration
# DEVICE="/dev/sdd1"
DEVICE_UUID="4e7c979b-40b1-4946-86fb-f2989915dc85"
MOUNT_POINT="/mnt/backup_disk"
SOURCE_DIR="/data/plex"
TARGET_DIR="${MOUNT_POINT}/data/plex"
RSYNC_OPTIONS="-a --ignore-existing --out-format=%n"
LOG_TIMESTAMP="$(date '+%Y%m%d-%H%M%S')"
LOG_FILE="/var/log/backup-media-pve-${LOG_TIMESTAMP}.log"

mkdir -p "${MOUNT_POINT}"
mkdir -p "${TARGET_DIR}"

if ! mountpoint -q "${MOUNT_POINT}"; then
  mount "UUID=${DEVICE_UUID}" "${MOUNT_POINT}"
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

#now prune existing log files to be less than 30 days old
find /var/log/ -name "backup-media-pve-*.log" -type f -mtime +30 -exec rm -f {} \;


