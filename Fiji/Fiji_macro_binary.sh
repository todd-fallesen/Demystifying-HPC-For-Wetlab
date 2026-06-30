#!/bin/bash

#SBATCH --job-name=macro-binary
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=ncpu
#SBATCH --mem=256G
#SBATCH --threads-per-core=1
#SBATCH --cpus-per-task=4


FIJI_DIR="/nemo/stp/lm/working/marcots/Fiji.app"
MACRO_PATH="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/Fiji/binary_nuclei_macro.ijm"
#MACRO_PATH="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/Fiji/test_todd.ijm"
INPUT_DIR="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/S-BIAD7/Full_Image_Stacks/"
OUTPUT_DIR="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Test_outputs/Fiji_outputs/"

"$FIJI_DIR/ImageJ-linux64" \
    --headless \
    --console \
    -macro "$MACRO_PATH" \
    "$INPUT_DIR,$OUTPUT_DIR"
