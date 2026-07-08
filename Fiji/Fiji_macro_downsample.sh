#!/bin/bash
# Run Fiji macro headless (downsample in Z, time, x and y.)
# The variables to change how much you downsample are in "reduce_dimensions_macro.ijm"
#SBATCH --job-name=macro-downsample
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --partition=ga100
#SBATCH --mem=256G    
#SBATCH --threads-per-core=1    
#SBATCH --cpus-per-task=4 

#SBATCH --gres=gpu:1 
 
FIJI_DIR="/nemo/stp/lm/working/marcots/Fiji.app"
MACRO_PATH="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Demystifying-HPC-For-Wetlab/Fiji/reduce_dimensions_macro.ijm"
INPUT_IMAGE="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/IDR0051_HyperStack.tif"
OUTPUT_DIR="/camp/home/fallest/Desktop/working/fallest/Projects/HPC_Paper/Test_outputs/Fiji_outputs/Downsample/"


# Create output directory if it does not exist
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Creating output directory: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR"
fi


"$FIJI_DIR/ImageJ-linux64" \
    --headless \
    --console \
    -macro "$MACRO_PATH" \
    "$INPUT_IMAGE,$OUTPUT_DIR"

# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab