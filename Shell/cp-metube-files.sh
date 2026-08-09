#!/bin/bash
set -euo pipefail

# Define source and destination directories
SOURCE_DIR="${SOURCE_DIR:-/opt/metube_downloads}"
DESTINATION_MUSIC_DIR="${DESTINATION_MUSIC_DIR:-/media/downloads/music}"
DESTINATION_VIDEO_DIR="${DESTINATION_VIDEO_DIR:-/media/downloads/MusicVideos}"

DRY_RUN=1
if [[ "${1:-}" == "--no-dry-run" || "${1:-}" == "-n" ]]; then
    DRY_RUN=0
fi

move_files_from_subdirs() {
    local src_root="$1"
    local dst_music="$2"
    local dst_video="$3"
    local dry_run="$4"

    if [[ "$dry_run" -eq 1 ]]; then
        echo "Dry run enabled; no files will be moved."
    else
        mkdir -p "$dst_music" "$dst_video"
    fi

    shopt -s nullglob
    for subdir in "$src_root"/*; do
        [ -d "$subdir" ] || continue

        local name
        name=$(basename "$subdir")

        local target_dir=""
        case "${name,,}" in
            *music*)
                target_dir="$dst_music"
                ;;
            *video*)
                target_dir="$dst_video"
                ;;
            *)
                echo "Skipping unrecognized subdirectory: $subdir"
                continue
                ;;
        esac

        if ! find "$subdir" -maxdepth 1 -type f -print -quit | grep -q .; then
            echo "No files found in $subdir"
            continue
        fi

        if [[ "$dry_run" -eq 1 ]]; then
            echo "[dry-run] Would move files from $subdir to $target_dir"
            find "$subdir" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
                echo "[dry-run] would move $(basename "$file") -> $target_dir/"
            done
        else
            echo "Moving files from $subdir to $target_dir"
            find "$subdir" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
                mv -v -- "$file" "$target_dir/"
            done

           # rmdir --ignore-fail-on-non-empty "$subdir" 2>/dev/null || true
        fi
    done
    shopt -u nullglob
}

move_files_from_subdirs "$SOURCE_DIR" "$DESTINATION_MUSIC_DIR" "$DESTINATION_VIDEO_DIR" "$DRY_RUN"

