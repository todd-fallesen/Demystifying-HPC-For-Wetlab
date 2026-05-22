#!/bin/bash

BASE_DIR="~/HPC_Paper/python/data/ExperimentA_Split_Channels_Sorted"
TASK_SCRIPT="~/HPC_Paper/python/python_seg_task_script.sh"

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
