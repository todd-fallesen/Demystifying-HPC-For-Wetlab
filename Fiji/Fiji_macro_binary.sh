#!/bin/bash
# Run Fiji macro headless (binary mask nuclei)
#SBATCH --job-name=macro-binary
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=ncpu
#SBATCH --mem=256G    
#SBATCH --threads-per-core=1    
#SBATCH --cpus-per-task=4 
 

 #Specifiy in the path below where Fiji lives in your installation. If you use a module based FIJI, you could use module load
cd /nemo/stp/lm/working/marcots/Fiji.app
./ImageJ-linux64 --headless --console -macro ../S-BIAD7/binary_nuclei_macro.ijm 

