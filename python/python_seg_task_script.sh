#!/bin/bash

#SBATCH --job-name=mmt
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --partition=ncpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mail-user=todd.fallesen@crick.ac.uk
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --output=/camp/home/fallest/working/fallest/CPOut/slurm-test.out
#SBATCH --error=/camp/home/fallest/working/fallest/CPOut/slurm-test.err



source $HOME/.bashrc
ml Anaconda3
conda activate scikit-image-env

echo $1
outdir=$(basename $1)
python "$HOME/HPC_Paper/python/segment_image.py" "${1}/" "${outdir}_output.tiff"



