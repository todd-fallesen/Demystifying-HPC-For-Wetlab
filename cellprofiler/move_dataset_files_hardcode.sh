#!/usr/bin/env bash

# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
## This shell script will demonstrate moving files using an HPC based on a Regular Expression


# --------------------------------------------------
# 1. Set the input and output directories
# --------------------------------------------------

SRC_DIR="/nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/Image_Set/S-BIAD7/ExperimentA_Split_Channels"
DEST_DIR="/nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/Image_Set/S-BIAD7/ExperimentA_Split_Channels_Sorted"


# --------------------------------------------------
# 2. Make sure the destination directory exists
# --------------------------------------------------

mkdir -p "$DEST_DIR"


# --------------------------------------------------
# 3. Loop over all TIFF files in the source directory
# --------------------------------------------------

for f in "$SRC_DIR"/*.tiff; do

    # Get just the filename (remove the path)
    filename=$(basename "$f")


    # --------------------------------------------------
    # 4. Check if the filename contains RepX_DIVY
    #    Example match: Rep1_DIV7
    # --------------------------------------------------

    if echo "$filename" | grep -q "Rep[0-9]*_DIV[0-9]*"; then

        # Extract the RepX_DIVY part
        image_set=$(echo "$filename" | grep -o "Rep[0-9]*_DIV[0-9]*")

        # Extract RepX from RepX_DIVY
        rep=$(echo "$image_set" | cut -d "_" -f 1)


        # --------------------------------------------------
        # 5. Create the folders and move the file
        # --------------------------------------------------

        mkdir -p "$DEST_DIR/$rep/$image_set"
        mv "$f" "$DEST_DIR/$rep/$image_set/"

    fi
done
``