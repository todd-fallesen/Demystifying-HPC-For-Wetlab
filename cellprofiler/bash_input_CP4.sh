#!/bin/bash
cd /camp/lab/niakank/working/Sophie/Microscopy/Image_Quant_New/
for f in *; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        echo /camp/lab/niakank/working/Sophie/Microscopy/Image_Quant_New/"$f"
		sbatch /camp/lab/niakank/working/Sophie/Microscopy/Image_Quant_New/CP4_task_script.sh /camp/lab/niakank/working/Sophie/Microscopy/Image_Quant_New/"$f"
    fi
done