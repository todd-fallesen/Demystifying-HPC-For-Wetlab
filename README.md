# Demystifying-HPC-For-Wetlab

Welcome to the GitHub Repository for “Demystifying HPC For Wet Lab Scientists.” This work was done jointly by:  Camille Charoy<sup>1</sup>, Ruaridh Gollifer<sup>2</sup>, Camilla Harris<sup>2</sup>, Courtney Hopf<sup>3</sup>, Stefania Marcotti<sup>1</sup>, Kimberly Meechan<sup>2</sup>, John Roche<sup>4</sup>, Todd Fallesen<sup>1</sup>,<sup>*</sup>  <br>

        1.   Crick Advanced Light Microscopy, The Francis Crick Institute, London UK   
        2.   Advanced Research Computing (ARC) Centre, University College London, London UK  
        3.   Department of Global Liberal Studies, New York University London  
        4.   ITO Research Computing Platforms The Francis Crick Institute, London UK  

## Introduction
The code here is meant to augment the teaching curriculum presented in our paper.  We have three separate software tracks, each of which demonstrates fundamental HPC skills in a manner that is applicable to wet-lab scientists learning command line computing and HPC for the first time.

## Demonstration Images
The demonstration dataset for this code is located here: https://crick.figshare.com/account/articles/32860817
The data are organised in this manner:  
-Demo_Image_set  
---S-BIAD7  
------ExperimentA  
------ExperimentA_Split_Channels  
------ExperimentA_Channel1   
---20210226  
 ------20210226_IDR.tif  

The dataset in S-BIAD7 is truncated from a much larger dataset in the BioImage Archive. The data is accessible at https://www.ebi.ac.uk/biostudies/bioimages/studies/S-BIAD7 The data was truncated for use in demonstration. There are 9 primary data files, in the folder "ExperimentA". These images all have 3 z-slices and 4 channels. In the folder "ExperiementA_Split_Channels" the primary data files are split by channel for ease in processing by CellProfiler. In the folder ExperimentA_Channel1 the images are only the first channel, and the first slice from each original image in ExperimentA.

The image 20210226_IDR.tif is an image of mouse lungs in 3 colors, taken from the Image Data Resource:  Study: idr0106-kubota-lunglightsheet, ID: 12689244.  The image was resized from it’s original 4992x4255 pixel size to 900x767 for ease of data transfer. 


## Software Tracks
Our three software tracks are: Python, CellProfiler, and Fiji.  These software packages are widely used in BioImage analysis and are readily available, with a strong support community behind them. The basis of the software tracks is not to teach how to do BioImage Analysis, but rather to show a simple procedure so that students can run their own pipelines built in these software packages

In all software tracks, we encourage instructors to work with the students to navigate to the demonstration data and practice working with the demonstration data using the command line interface. To facilitate that we have written two simple scripts *move_dataset_files_hardcode.sh* and *move_datasets_files_parameter.sh* which demonstrate using a script to automate grouping of image files by filename structure into new folders. 

### Python Track
In the Python track, the code is developed to perform nuclei segmentation of fluorescent images and generate segmentation masks. The demonstration images are in ExperiementA_Channel1.  The code will create a new job for each image, so that all images are segmented in parallel.

In the python track, students will:  
* Navigate file systems  
* Learn conda environments  
* Create a conda environment from scratch  
* Edit a shell script  
* Run a shell script to run python  <br>

The full description of how the code works is found at [main/python].

### CellProfiler Track
The CellProfiler pipeline is similar to the Python track pipeline.  The CellProfiler pipeline will segment the nuclei, measure and save in a csv file their area and intensity, and create an output image showing the segmentation objects. 
The demonstration images are in ExperiementA_Split_Channels.  The data should be further processed using  *move_dataset_files_hardcode.sh* or *move_datasets_files_parameter.sh* to group the files. If this is done, the CellProfiler submission script will create a new job for each image set, so that they are processed in parallel. 

In the CellProfiler track, students will:  
* Navigate the file system  
* Learn conda environments  
* Create a conda environment from a file  
* Edit a shell script  
* Run a shell script to run CellProfiler  <br>

The full description of how the code works is found at [main/python].

### Fiji Track

In the Fiji Track, there are two types of demonstration.  In the first, students will segment nuclei in the same manner as in the Python and CellProfiler tracks.  (This is *Fiji_macro_binary.sh* and the associated file **binary_nuclei_macro.ijm*.  The second demonstration is reducing the dimensions of a file, so that it can be easily viewed on a personal computer. A common issue wet-lab scientists have is wanting to visualize their microscopy data, but it is too large to open on a personal computer. *Fiji_macro_downsample.sh* and *reduce_dimensions_macro.ijm* work to take a large image and reduce it’s size to something manageable for visualization on a personal computer.  The data used for Fiji_macro_binary.sh is in ExperimentA_Channel1.  The data used for Fiji_macro_downsample.sh is 20210226_IDR.tif.  

In the Fiji track, students will:  
* Navigate the file system  
* Install Fiji on a linux system  
* Edit a shell script  
* Run a shell script to run Fiji  

  The full description of how the code works is found at [main/python].
