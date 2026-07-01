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



source ~/.bashrc
ml Anaconda3
ml GCC
ml Java
conda activate cp426_nemo_v1

echo "Todd"
echo $1
outdir=$(basename $1)
cellprofiler -c -r -p /nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/Code/Simple_Segmentation.cppipe -i "${1}/" -o "/nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/CP_Output/${outdir}_output"



# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
# This shell script runs a cellprofiler pipeline on a single image set