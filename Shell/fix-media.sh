#!/usr/bin/env bash
#

# Script to set owner:group to share:share and permissions to 755 
# so that plex and jellyfin can read media files
# Intended to be run from cron/chrony

set -euo pipefail

# Log output when run from cron
LOG="/var/log/fixmedia-cron.log"
# Ensure log dir and file exist (create with current user permissions)
mkdir -p "$(dirname "$LOG")"
touch "$LOG" || true
# Prefix each run with a timestamp and redirect all output to the log
echo "----- $(date --iso-8601=seconds) -----" >>"$LOG"
exec >>"$LOG" 2>&1



TARGET="/nfsdata/plex/MusicVideos"

if [ ! -d "$TARGET" ]; then
	echo "Target not found: $TARGET" >&2
	exit 1
fi

# Ensure ownership
chown -R share:share "$TARGET"

# Ensure permissions (files and directories set to 755 as requested)
chmod -R 755 "$TARGET"

exit 0
