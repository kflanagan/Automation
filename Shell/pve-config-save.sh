#!/bin/bash

# This script is used to backup the Proxmox VE configuration files to a specified directory
# It will create a tarball of the configuration files and save it to the specified directory
# Usage: ./pve-config-backup.sh /path/to/backup/directory


# SET DEFAULT DESTINATION HOST AND BACKUP DIRECTORY, and other variables
DEFAULT_DEST_HOST="pve-mini"
BACKUP_DIR="/tmp/pve-config-backups"
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
HOSTNAME=$(hostname)
BACKUP_FILE="$BACKUP_DIR/pve-config-backup-$HOSTNAME-$TIMESTAMP.tar"
DEST_HOST="${DEST_HOST:-$DEFAULT_DEST_HOST}"
DEST_PATH="/backups"


prepare_backup_dir() {
    if [ ! -d "$BACKUP_DIR" ]; then
        echo "Backup directory $BACKUP_DIR does not exist. Creating it..."
    fi

    mkdir -p "$BACKUP_DIR"
    echo "Backup directory: $BACKUP_DIR"

    find "$BACKUP_DIR" -type f -name "pve-config-backup-*.tar.gz" -delete
    echo "Old backups cleaned up from $BACKUP_DIR"
}

prepare_backup_dir

ensure_sshpass_installed() {
    if ! command -v sshpass &> /dev/null
    then
        echo "sshpass could not be found, installing it..."
        apt-get update && apt-get install -y sshpass
    fi
}

ensure_sshpass_installed

create_backup() {
    # Create a tarball of the Proxmox VE configuration files
    tar -cvf "$BACKUP_FILE" /etc/pve
    echo "Proxmox VE configuration files backed up to $BACKUP_FILE"

    # Optionally, you can also backup the /etc/network/interfaces file if you have custom network configurations
    tar -rvf "$BACKUP_FILE" /etc/network/interfaces
    echo "Network interfaces configuration added to $BACKUP_FILE"

    # Also backup the /etc/hosts file in case there are custom host entries
    tar -rvf "$BACKUP_FILE" /etc/hosts
    echo "Hosts file added to $BACKUP_FILE"

    # Adding more configuration files to backup /etc/resolv.conf, /etc/fstab, etc.
    tar -rvf "$BACKUP_FILE" /etc/fstab
    tar -rvf "$BACKUP_FILE" /etc/resolv.conf
}

create_backup

# Compress the backup
gzip $BACKUP_FILE
# Move the backup to pve-mini

# Destination host and path for remote backups (change DEFAULT_DEST_HOST as needed)

# Function to move backup to remote host
move_backup_to_remote() {
    if [ "$HOSTNAME" == "$DEST_HOST" ]; then
        echo "Skipping backup transfer: current host is the same as destination host ($DEST_HOST)."
        return 0
    fi
    
    echo "Moving backup to ${DEST_HOST}:${DEST_PATH}/"
    read -sp "Enter root password for ${DEST_HOST}: " ROOT_PASSWORD
    echo
    sshpass -p "$ROOT_PASSWORD" scp "$BACKUP_FILE.gz" root@"$DEST_HOST":"${DEST_PATH}/"
    echo "Backup moved to ${DEST_HOST}:${DEST_PATH}/"
}

move_backup_to_remote

#Now make a function that if the current host is the same as the destination host, it will move the backup to /data/backups instead of the remote host

move_backup_to_local() {
    if [ "$HOSTNAME" != "$DEST_HOST" ]; then
        echo "Skipping local backup move: current host is not the same as destination host ($DEST_HOST)."
        return 0
    fi
    
    echo "Moving backup to /data/backups/"
    mkdir -p /data/backups
    mv "$BACKUP_FILE.gz" /data/backups/
    echo "Backup moved to /data/backups/"
}

move_backup_to_local

echo "Backup completed successfully."

