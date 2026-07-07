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

## Instructors note:
All code here is provided as a template. It will have to be modified for use at your instutition while teaching. 
For example, in the SBATCH parameters, partition names and email addresses should be modified. Other parameters may need to be modified to work with your system.
As every HPC system is different, we rely on the expierence of the local instructors to customize the code for their learners. 

## Conda environment

You will need to create a conda environment called `cp_428` on your cluster. 
The file *install_cellprofiler.sh* is provided to help you install CellProfiler as a conda environment, but the instructor will need to modify this script to work on the local HPC system.
Follow your institution's or insturctors instructions for setting this up.

To install: download the *install_cellprofiler.sh* script into a folder into which you have read/write access.
Make sure that you have conda installed on your system. 
*Note* the script uses `ml Anaconda3` to load conda. Your HPC system may use something different.
Run the installation script as specified on your system.

### Installing CellProfiler directly from yml
Some instructors may choose to install directly from the yml file, if you wish to add that to your curriculum.
To do so:
'''

```
ml Anaconda3
ml Java
ml GCC
conda env create --file cp_428.yml
```

### Activating CellProfiler Environment
```
ml Anaconda3
ml Java
ml GCC
conda activate cp_428
```

## Test data
All data can be downloaded from : 
The CellProfiler demo can be run in parts, each of which can be done independently.
Test data for the `move_dataset_files_hardcode.sh` and `move_dataset_files_parameter.sh` are in `Demo_Image_Set\S-BIAD7\ExperimentA_Split_Channels`
This same dataset can be used for the `CellProfiler_Single_Set.sh` and the `job_submission_script.sh`, but it is not recommended. 

We recommend that you run either `move_dataset_files_hardcode.sh` or `move_dataset_files_parameter.sh` first which will create a new folder `ExperimentA_Split_Channels_Sorted`, which is better suited for CellProfiler.

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

