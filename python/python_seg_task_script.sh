#!/bin/bash
#This is a basic shell script to submit a python script to HPC to run on an image. 
#This is run internally by job_submission_script.sh

#SBATCH --job-name=mmt
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --partition=ncpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=logs/slurm.%x.%j.out
#SBATCH --error=logs/slurm.%x.%j.err



ml Anaconda3                                             # load Anaconda
source "$(conda info --base)/etc/profile.d/conda.sh"     # Source the conda.sh script to enable conda commands in the shell
conda activate scikit-image-env                          # Activate the conda environment named "scikit-image-env"

echo $1                                                  # Print the first argument passed to the script (the image file path)
filename=$(basename $1 .tiff)                            # Extract the base name of the image file without the .tiff extension
input_dir=$(dirname "$1")                                # Get the directory of the input image
mkdir -p "$input_dir/output"                             # Create the output directory if it doesn't exist
output_file="$input_dir/output/${filename}_output.tiff"  # Define the output file path

python "$HOME/HPC_Paper/python/segment_image.py" "${1}/" "$output_file" # Run the Python script with the input and output file paths

# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
