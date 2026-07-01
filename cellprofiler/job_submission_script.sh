#!/bin/bash

# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab

# This is the script to submit cellprofiler jobs to the cluster.  To change the cellprofiler pipeline, change it in "CP4_task_script.sh"

BASE_DIR="/nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/Image_Set/S-BIAD7/ExperimentA_Split_Channels_Sorted"
TASK_SCRIPT="/nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/Code/CP4_task_script.sh"

cd "$BASE_DIR" || exit 1

for rep in Rep*; do
    if [ -d "$rep" ]; then
        for imageset in "$rep"/*; do
            if [ -d "$imageset" ]; then

                # Get just the folder name (e.g. Rep1_DIV7)
                jobname=$(basename "$imageset")

                echo "Submitting job $jobname"
				echo "$BASE_DIR/$imageset"
                sbatch --job-name="$jobname" "$TASK_SCRIPT" "$BASE_DIR/$imageset"
				
            fi
        done
    fi
done
