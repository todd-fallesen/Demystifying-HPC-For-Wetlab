#!/bin/bash

#SBATCH --job-name=mmt
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --partition=ncpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mail-user=todd.fallesen@crick.ac.uk
#SBATCH --output=/camp/home/fallest/working/fallest/CPOut/slurm-test.out
#SBATCH --output=logs/slurm.%x.%N.%j.out
#SBATCH --error=logs/slurm.%x.%N.%j.err



ml Anaconda3
conda activate scikit-image-env

echo $1
filename=$(basename $1 .tiff)
python "$HOME/HPC_Paper/python/segment_image.py" "${1}/" "${filename}_output.tiff"



