# Demystifying-HPC-For-Wetlab

Welcome to the GitHub Repository for “Demystifying HPC For Wet Lab Scientists.” This work was done jointly by:  Camille Charoy<sup>1</sup>, Ruaridh Gollifer<sup>2</sup>, Camilla Harris<sup>2</sup>, Courtney Hopf<sup>3</sup>, Stefania Marcotti<sup>1</sup>, Kimberly Meechan<sup>2</sup>, John Roche<sup>4</sup>, Todd Fallesen<sup>1</sup>,<sup>*</sup>  <br>

        1.   Crick Advanced Light Microscopy, The Francis Crick Institute, London UK   
        2.   Advanced Research Computing (ARC) Centre, University College London, London UK  
        3.  Department of Global Liberal Studies, New York University London  
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
