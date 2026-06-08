#!/bin/bash

BASE_DIR="$HOME/HPC_Paper/python/data"
TASK_SCRIPT="$HOME/HPC_Paper/python/python_seg_task_script.sh"

cd "$BASE_DIR" || exit 1

for imageset in *tiff; do
    [ -f "$imageset" ] || continue

    jobname="${imageset%.tiff}"

    echo "Submitting job $jobname"
    echo "$BASE_DIR/$imageset"
    sbatch --job-name="$jobname" "$TASK_SCRIPT" "$BASE_DIR/$imageset"

done
