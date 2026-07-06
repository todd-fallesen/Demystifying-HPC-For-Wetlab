# Cellprofiler

In this example, we will use a shell script to submit a Cellprofiler job to segment nuclei in a series of 2D tiff images. 

## Files
| File name     | Description   |
| ------------- | ------------- |
| move_dataset_files_hardcode.sh | Shell Script to move the split channels data into seperate folders based on *Rep* and *Div* using Regular expressions. Directories must be specified in script|
| move_dataset_files_parameter.sh  | same as *move_dataset_files_hardcode.sh* but can be called with parameters, *move_dataset_files_parameter.sh /path/to/source /path/to/destination*  |
| cp_428.yml  | Environment file for CellProfiler  |
| install_cellprofiler.sh  | Shell Script to download and install CellProfiler environment  |
| CellProfiler_Single_Set.sh | Shell Script to demonstrate how to submit a single CellProfiler job on one image set  |
| job_submission_script.sh  | Shell Script to submit multiple CellProfiler jobs over image sets seperated in folders in a top-level folder |
| CP4_task_script.sh | Shell Script is called from *job_submission_script.sh* to submit a CellProfiler job for each image set in the top-level folder|
| Simple_Segmentation.cppipe  | CellProfiler segmentation pipeline to segment the nuclei, save out an image file and a csv file of measurements |
| Simple_Segmentation.cpproj  | CellProfiler project file, same as Simple_Segmentation.cppipe, but as an entire project file   |

## Conda environment

You will need to create a conda environment called `cp_428` on your cluster. 
We Follow your institution's instructions for setting this up.

This environment should contain `scikit-image` e.g.

```
conda create -n scikit-image-env python=3.12
conda activate scikit-image-env
pip install scikit-image
```

## Test data

This script uses a single directory of test data containing 9 2D tiff images. Download from [TBD - Zenodo link]

## Parts that need to be adapted for your cluster

In `job_submission_script.sh`:

- Update the `BASE_DIR` path to match the location of the test data
- Update the `TASK_SCRIPT` path to match the location of `python_seg_task_script.sh`

In `python_seg_task_script.sh`:

- Update the `#SBATCH --partition=ncpu` to match the name of the appropriate partition on your cluster
- Update the `ml Anaconda3` line, to match the name of the module containing conda on your cluster
- Update the path in the last line to match the location of `segment_image.py`

## Submitting the jobs

Run:
```
sbatch job_submission_script.sh
```

This will submit one job per input image, allowing them to be processed in parallel.

Segmented images will be written to `BASE_DIR` with an `_output` suffix. Slurm logs are inside `BASE_DIR`, in a sub-directory called `logs`. 

