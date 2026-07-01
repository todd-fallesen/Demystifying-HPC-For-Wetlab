#!/bin/bash
# This script is to run the fiji macro "binary_nuclei_macro.ijm" 
# This can be used as a template for to submit a job to run any macro
#SBATCH --job-name=macro-binary
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=ncpu
#SBATCH --mem=256G
#SBATCH --threads-per-core=1
#SBATCH --cpus-per-task=4


FIJI_DIR="/nemo/stp/lm/working/marcots/Fiji.app"
MACRO_PATH="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/Fiji/binary_nuclei_macro.ijm"
INPUT_DIR="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/S-BIAD7/Full_Image_Stacks/"
OUTPUT_DIR="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Test_outputs/Fiji_outputs/"

"$FIJI_DIR/ImageJ-linux64" \
    --headless \
    --console \
    -macro "$MACRO_PATH" \
    "$INPUT_DIR,$OUTPUT_DIR"


# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
