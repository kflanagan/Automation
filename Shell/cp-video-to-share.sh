# This shell script copies video files from a specified source directory to a destination directory on a remote server using SCP.
# This would be used on the metube container
#!/bin/bash
# Define source and destination directories
SOURCE_DIR="/opt/metube_downloads"
DESTINATION_USER="root"
DESTINATION_HOST="pve-mini"
DESTINATION_DIR="/data/plex/MusicVideos"
# Define separate destination directories for music and videos
DESTINATION_MUSIC_DIR="/data/plex/music"
DESTINATION_VIDEO_DIR="/data/plex/MusicVideos"

copy_and_remove() {
    local src_dir="$1"
    local dst_dir="$2"
    local label="$3"

    if [ -d "$src_dir" ]; then
        echo "Copying $label files from $src_dir to $DESTINATION_HOST:$dst_dir"
        # Copy the CONTENTS of src_dir into the destination dir (don't create an extra top-level "music" or "videos" folder)
        scp -r "$src_dir"/. "$DESTINATION_USER@$DESTINATION_HOST:$dst_dir"
        if [ $? -eq 0 ]; then
            rm -rf "$src_dir"
            echo "$label files copied successfully and removed from $src_dir"
        else
            echo "Error copying $label files from $src_dir"
        fi
    else
        echo "No $label source directory found at $src_dir"
    fi
}

copy_and_remove "$SOURCE_DIR/music" "$DESTINATION_MUSIC_DIR" "music"
copy_and_remove "$SOURCE_DIR/videos" "$DESTINATION_VIDEO_DIR" "videos"


