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
conda activate cp428

echo $1
#$1 is the input folder
PIPELINE_FILE="/nemo/stp/lm/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/cellprofiler/Simple_Segmentation.cppipe"
OUTPUT_FOLDER="/nemo/stp/lm/working/fallest/Projects/HPC_Paper/CellProfiler/CP_Output/"
outdir=$(basename "$1")
cellprofiler -c -r -p "$PIPELINE_FILE" -i "${1}/" -o "${OUTPUT_FOLDER}${outdir}_output"



# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
# This shell script runs a cellprofiler pipeline on a single image set