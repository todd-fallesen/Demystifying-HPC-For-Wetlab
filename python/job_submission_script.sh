#!/bin/
#This job submission script iterates through the images in the BASE_DIR and runs the python script on them. 
#The python script is set in "python_seg_task_script.sh"

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


# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
