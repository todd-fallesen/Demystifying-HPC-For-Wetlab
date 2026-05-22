#!/usr/bin/env bash

SRC_DIR="$1"
DEST_DIR="$2"

if [[ -z "$SRC_DIR" || -z "$DEST_DIR" ]]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

mkdir -p "$DEST_DIR"

for f in "$SRC_DIR"/*.tiff; do
    filename="$(basename "$f")"

    if [[ $filename =~ ^(Rep[0-9]+)_(DIV[0-9]+)_ ]]; then
        rep="${BASH_REMATCH[1]}"
        div="${BASH_REMATCH[2]}"
        subfolder="${rep}_${div}"

        mkdir -p "$DEST_DIR/$rep/$subfolder"
        mv "$f" "$DEST_DIR/$rep/$subfolder/"
    fi
done

#to run bash move_dataset_files_parameter.sh path/to/images path/to/output