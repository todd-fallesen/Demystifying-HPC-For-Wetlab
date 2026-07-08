#!/bin/bash
#This job submission script iterates through the images in the BASE_DIR and runs the python script on them. 
#The python script is set in "python_seg_task_script.sh"

BASE_DIR="$HOME/HPC_Paper/Demo_Image_Set/S-BIAD7/Experiment_A_Channel1" #   Set the base directory where the images are located
TASK_SCRIPT="$HOME/HPC_Paper/python/python_seg_task_script.sh"          #   Set the path to the task script that will be submitted to the job scheduler

cd "$BASE_DIR" || exit 1                                                # Change to the base directory, exit with an error if it fails

for imageset in *tiff; do                                               #  Iterate over all files in the base directory that match the pattern *tiff
    [ -f "$imageset" ] || continue

    jobname="${imageset%.tiff}"                                         #  Set the job name to the base name of the image file without the .tiff extension

    echo "Submitting job $jobname"                                      #  Print a message indicating that the job is being submitted
    echo "$BASE_DIR/$imageset"                                           #  Print the full path of the image file being processed
    sbatch --job-name="$jobname" "$TASK_SCRIPT" "$BASE_DIR/$imageset"    # Submit the job to the scheduler with the specified job name and pass the image file path as an argument to the task script

done


# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
