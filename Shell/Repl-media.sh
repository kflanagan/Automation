#!/usr/bin/env bash
# This script replicates media files from a source directory to a target directory using rsync. It logs the process and handles errors gracefully.


set -euo pipefail

LOG_FILE_BASE="${REPL_MEDIA_LOG:-/var/log/repl-media.log}"
LOG_TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
LOG_FILE="${LOG_FILE_BASE}.${LOG_TIMESTAMP}"
SOURCE_DIR="${REPL_MEDIA_SOURCE:-/data/}"
TARGET_DIR="${REPL_MEDIA_TARGET:-pve-tower:/data/}"

cleanup_old_logs() {
	local log_dir log_name old_log
	local -a logs

	log_dir=$(dirname -- "$LOG_FILE_BASE")
	log_name=$(basename -- "$LOG_FILE_BASE")
	mapfile -t logs < <(find "$log_dir" -maxdepth 1 -type f -name "${log_name}.*" -printf '%f\n' | sort -r)

	if (( ${#logs[@]} > 3 )); then
		for old_log in "${logs[@]:3}"; do
			rm -f -- "$log_dir/$old_log"
		done
	fi
}

if ! touch "$LOG_FILE"; then
	printf 'ERROR: unable to write to log file: %s\n' "$LOG_FILE" >&2
	exit 1
fi

exec > >(tee -a "$LOG_FILE") 2>&1

trap 'status=$?; printf "ERROR: command failed on line %s with exit status %s: %s\n" "$LINENO" "$status" "$BASH_COMMAND" >&2; exit "$status"' ERR

printf 'Starting media replication at %s\n' "$(date --iso-8601=seconds)"


rsync -aHAX --recursive --ignore-existing --info=progress2 "$SOURCE_DIR" "$TARGET_DIR"
printf 'Media replication completed at %s\n' "$(date --iso-8601=seconds)"
cleanup_old_logs


