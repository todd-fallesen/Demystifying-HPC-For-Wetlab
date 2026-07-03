## Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis

### Fiji examples

* #### Downsampling for visualisation

    An approach one might take to visualise their image data if too large to open on a local machine is to downsample the dataset first, with the aim of reducing the computational resources required. To this aim, it is possible to run a Fiji macro via a standard HPC bash job, by taking advantage of Fiji headless mode.

    The bash script `Fiji_macro_downsample.sh` requests HPC resources and runs the Fiji macro `reduce_dimensions_macro.ijm` headless. The macro expects a dataset stored remotely, it downsamples it and save a downsampled version for local browsing.

* #### Obtaining binary masks

    Another common task one might want to perform with a Fiji macro is to obtain binary segmentation masks for a single channel of a multi-channel microscopy image dataset. 

    The bash script `Fiji_macro_binary.sh` requests HPC resources and runs the Fiji macro `binary_nuclei_macro.ijm` headless. The macro expects a dataset stored remotely, it opens one image at a time, creates a maximum intensity projection of all Z-slices, selects the channel containing the nuclei, performs a Gaussian blur and thresholds the resulting image using Otsu's algorithm. It then saves the binary mask in an output folder of choice.


