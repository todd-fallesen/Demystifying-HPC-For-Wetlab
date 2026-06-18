#!/bin/bash

#SBATCH --job-name=mmt
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --partition=ncpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=logs/slurm.%x.%j.out
#SBATCH --error=logs/slurm.%x.%j.err



ml Anaconda3
conda activate scikit-image-env

echo $1
filename=$(basename $1 .tiff)
python "$HOME/HPC_Paper/python/segment_image.py" "${1}/" "${filename}_output.tiff"



