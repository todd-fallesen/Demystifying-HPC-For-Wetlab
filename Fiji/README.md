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
The course is structured in such a way that the teaching examples can be taught using CellProfiler, Fiji or Python. All of the tracks use shell scripting.

A common issue faced by experimentalists is represented by opening and browsing large image datasets, which can prove challenging on local machines with limited computational power. Additionally, interacting locally with large datasets often means transferring the data from remote to local storage, creating unnecessary duplication and slowing processing.

Using a remote web access to a supercomputer, such as Open On Demand, might serve as the first interaction a user might have with HPC, when dealing with this type of operation. In fact, these implementations allow for easy access to a virtual machine, providing an interface accessible via a web browser and lowering access barriers for people who might have limited experience in using the terminal.

Access might be dependent on local infrastructure, but is likely going to require setting up a pair of Secure SHell protocol (SSH) keys. Resources are requested and allocated for remote web access similarly to a standard bash script job request, but often exploit a more user-friendly interface. In a common infrastructure set up, user data storage is directly connected to the HPC resources, removing the need for data transfer and duplication.

It is possible to install and run image analysis software via these remote web access clients, offering a similar user experience to interacting with local machines thanks to the web interface. 

We are using as an example a 4D dataset from the Image Data Resource ([idr0051](https://idr.openmicroscopy.org/webclient/?show=project-552), `/​​idr0051-fulton-tailbudlightsheet/20181025-ftp/Dataset_1/Processed Image Files`) to demonstrate a common pipeline which a user might want to implement to open and browse a large dataset. The image dataset is a pre-registered lightsheet acquisition of a developing zebrafish tailbud, containing one channel, 451 Z-slices and 132 timepoints. We provide an example dataset at `Demo_Image_Set\20210226\`. Opening this dataset in Fiji on a local machine is likely to result in an out-of-memory error, as it has a size of about 800 MB. 

The workflow to open the dataset via web remote access to HPC requires the following steps:
* Request a session with suitable resources via the institutional portal. For this example, we requested a GPU single node session with 4 cores, 64 GB memory and 1 GPU with graphic acceleration.
* Open Fiji. Depending on the installation settings specific to the institution, this might be via module loading, a dedicated bash script or double-clicking on the remote desktop icon. In our case, users install a Linux instance of Fiji in their lab space, and open it via a bash script.
* Import and browse the data in Fiji. This can be achieved similarly to what a user might do locally on their machine, by using the Bio-Formats plugin or by importing the image sequence and using the sliders below the image window to move the data in Z and time.

### Downsampling for visualisation

Should a remote browser access to HPC such as OnDemand not be available at an institution, an approach one might take to visualise their data if too large is to downsample them first, with the aim of reducing the computational resources required to perform the task locally. To this aim, it is possible to run a Fiji macro via a standard HPC bash job, by taking advantage of Fiji headless mode and using the HPC via CLI.

The workflow to downsample a dataset stored remotely and save a downsampled version for local browsing using a Fiji macro on HPC might look as follows:
* Login into the HPC. This is likely achieved using the terminal via the SSH protocol.
* Run a bash script to perform the task. This requests resources and runs the macro headless.

The bash script `Fiji_macro_downsample.sh` requests HPC resources and runs the Fiji macro `reduce_dimensions_macro.ijm` headless. The macro expects a dataset stored remotely, it downsamples it and save a downsampled version for local browsing.

The SBATCH parameters (e.g., partition name `#SBATCH --partition=ncpu`) and input/output directory names (`FIJI_DIR`, `MACRO_PATH`, `INPUT_DIR`, `OUTPUT_DIR`) in the shell script needs to be adapted according to local sytems. Downsample parameters can be changed directly in the macro.

### Obtaining binary masks

We also provide a separate example workflow to obtain binary masks from a multi-channel microscopy image, working on the same dataset as the CellProfiler and Python tracks (`Demo_Image_Set\S-BIAD7\ExperimentA\`). The set up with a bash script and a Fiji macro running headless is analogous to the one described above.

The bash script `Fiji_macro_binary.sh` requests HPC resources and runs the Fiji macro `binary_nuclei_macro.ijm` headless. The macro expects a dataset stored remotely, it opens one image at a time, creates a maximum intensity projection of all Z-slices, selects the channel containing the nuclei, performs a Gaussian blur and thresholds the resulting image using Otsu's algorithm. It then saves the binary mask in an output folder of choice.

The SBATCH parameters (e.g., partition name `#SBATCH --partition=ncpu`) and input/output directory names (`FIJI_DIR`, `MACRO_PATH`, `INPUT_DIR`, `OUTPUT_DIR`) in the shell script needs to be adapted according to local sytems. 

