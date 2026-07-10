# Fiji

In this section, we will look at two teaching examples of using Fiji on HPC. They both rely on submitting a shell script to run a Fiji macro in headless mode.

## Files

| File name     | Description   |
| ------------- | ------------- |
| `Fiji_macro_binary.sh` | Shell script to run the `binary_nuclei_macro.ijm` Fiji macro |
| `Fiji_macro_downsample.sh` | Shell script to run the `reduce_dimensions_macro.ijm` Fiji macro |
| `binary_nuclei_macro.ijm` | Fiji macro which segments the nuclei in the corresponding channel for each image in a folder and saves binary masks as output |
| `reduce_dimensions_macro.ijm` | Fiji macro which downsamples images in a folder to a requested size and saves them |

## Instructors note

All code here is provided as a template. It will have to be modified for use at your instutition while teaching. 
For example, in the SBATCH parameters, partition names and email addresses should be modified. Other parameters may need to be modified to work with your system.
As every HPC system is different, we rely on the expierence of the local instructors to customize the code for their learners. 

## Suggested teaching order for Fiji track
The course is structured in such a way that the teaching examples can be taught using CellProfiler, Fiji Or Python. All of the tracks use shell scripting.

If a remote web access to a supercomputer, such as Open On Demand, is available at their institution, we suggest trainers to first show participants how to use the virtual desktop to perform standard image analysis related tasks, such as browsing a large dataset using Fiji. For this application, we provide an example dataset at `Demo_Image_Set\20210226\`. This dataset is freely available from the Image Data Resource ([idr0051]([https://idr.openmicroscopy.org/webclient/?show=project-552])) and represents a pre-registered lightsheet acquisition of a developing zebrafish tailbud.

Subsequently, trainers can show how trying to open the same dataset on a local machine would result in out-of-memory errors. An approach to solve this problem, would be to downsample the dataset, as illustrated below.

### Downsampling for visualisation

An approach one might take to visualise their image data if too large to open on a local machine is to downsample the dataset first, with the aim of reducing the computational resources required. To this aim, it is possible to run a Fiji macro via a standard HPC bash job, by taking advantage of Fiji headless mode.

The bash script `Fiji_macro_downsample.sh` requests HPC resources and runs the Fiji macro `reduce_dimensions_macro.ijm` headless. The macro expects a dataset stored remotely, it downsamples it and save a downsampled version for local browsing.

The SBATCH parameters (e.g., partition name `#SBATCH --partition=ncpu`) and input/output directory names (`FIJI_DIR`, `MACRO_PATH`, `INPUT_DIR`, `OUTPUT_DIR`) in the shell script needs to be adapted according to local sytems. Downsample parameters can be changed directly in the macro.

### Obtaining binary masks

Finally, using the same dataset as the CellProfiler and Python tracks (`Demo_Image_Set\S-BIAD7\ExperimentA\`), participants can be shown how to perform a common segmentation task, by running a Fiji macro is to obtain binary masks for a single channel of a multi-channel microscopy image dataset. 

The bash script `Fiji_macro_binary.sh` requests HPC resources and runs the Fiji macro `binary_nuclei_macro.ijm` headless. The macro expects a dataset stored remotely, it opens one image at a time, creates a maximum intensity projection of all Z-slices, selects the channel containing the nuclei, performs a Gaussian blur and thresholds the resulting image using Otsu's algorithm. It then saves the binary mask in an output folder of choice.

The SBATCH parameters (e.g., partition name `#SBATCH --partition=ncpu`) and input/output directory names (`FIJI_DIR`, `MACRO_PATH`, `INPUT_DIR`, `OUTPUT_DIR`) in the shell script needs to be adapted according to local sytems. 

