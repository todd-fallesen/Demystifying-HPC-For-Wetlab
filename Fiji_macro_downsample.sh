#!/bin/bash
# Run Fiji macro headless (downsample in Z and time)
#SBATCH --job-name=macro-downsample
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --partition=ga100
#SBATCH --mem=256G    
#SBATCH --threads-per-core=1    
#SBATCH --cpus-per-task=4 

#SBATCH --gres=gpu:1 
 
cd /nemo/stp/lm/working/marcots/Fiji.app
./ImageJ-linux64 --headless --console -macro ../IDR0051/reduce_dimensions_macro_no_arg_test.ijm 


