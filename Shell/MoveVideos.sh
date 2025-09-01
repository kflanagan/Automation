#!/bin/bash

SOURCE_DIR="/nfsdata/plex/"
DEST_DIR="$SOURCE_DIR/MusicVideos"

mkdir -p "$DEST_DIR"

find "$SOURCE_DIR/downloads" -maxdepth 1 -type f -name "*.mp4" | while read -r file; do
    chown share:share "$file"
    chmod 755 "$file"
    mv "$file" "$DEST_DIR/"
done