# Shell Scripts

This is the location of our stand alone ShellS cripts for Demystifying HPC For Wet Lab Scientists

## Files
| File name     | Description   |
| ------------- | ------------- |
| Hello_World.sh | Shell script to demonstrate basic shell commands of echo, and variable calling|
| Hello_World_Advanced.sh | Builds on Hello_World.sh to show how to pass a variable from the command line, and if/then statements.|
| move_dataset_files_hardcode.sh | Shell Script to move the split channels data into seperate folders based on *Rep* and *Div* using Regular expressions. Directories must be specified in script|
| move_dataset_files_parameter.sh  | same as *move_dataset_files_hardcode.sh* but can be called with parameters, *move_dataset_files_parameter.sh /path/to/source /path/to/destination*  |

## Suggested use of Shell Scritps

### Hello_World.sh
This shell script is very basic.  It can be explored to show basic script structure.  Running the script prompts the user for their name, which they enter, and it says Hello, User! The date and time is : "

### Hello_World_Advanced.sh
This script builds on Hello_World.sh.  A user can pass their name via the command line, `./Hello_World_Advanced.sh Paul` will print "Hello, Paul! The date and time is : "
If the user doesn't pass a variable, the script will prompt the user for one.  This will demonstrate if/then statements and passing variables from the command line.

### move_dataset_files scripts
These scripts are most associated with the CellProfiler track, but can be used to show regular expresions and file management. 

The course is structured in such a way that the teaching examples can be taught using CellProfiler, Fiji Or Python. All of the tracks use shell scripting.
In this track, the use of Fiji is also optional, but can be useful.  The Demo dataset in `ExperimentA` is in multi-channel z-stacks. 
There is a Fiji script provided `split_channels_keep_1_slice.ijm` which can be used to split the data in `ExperimentA` into single channel, single slice images.
To use the Fiji script, you must run `split_channels_fiji.sh`. 
The results of `split_channels_keep_1_slice.ijm` are the same as in the Test Data `Demo_Image_Set\S-BIAD7\ExperimentA_Split_Channels`

We then suggested you use `move_dataset_files_hardcode.sh` or `move_dataset_files_parameter.sh` to demonstrate moving files using shell scripting.
Running this will also create nested folders for each `Rep` and `Div` image set, so that CellProfiler can be run over many image sets simultanously. 

Finally, we suggest teaching `job_submission_script.sh` with `CP4_task_script.sh` to demonstrate running parallel CellProfiler jobs.
If you wish to have a preceeding step, demonstrating calling CellProfiler from the command line, you can use `CellProfiler_Single_Set.sh`.



## Test data
All data can be downloaded from : 
Test data for the `move_dataset_files_hardcode.sh` and `move_dataset_files_parameter.sh` are in `Demo_Image_Set\S-BIAD7\ExperimentA_Split_Channels`
We recommend that you run either `move_dataset_files_hardcode.sh` or `move_dataset_files_parameter.sh` first which to create a new folder `ExperimentA_Split_Channels_Sorted`, which is better suited for CellProfiler.

## Instructors note:
All code here is provided as a template. It will have to be modified for use at your instutition while teaching. 
For example, in the SBATCH parameters, partition names and email addresses should be modified. Other parameters may need to be modified to work with your system.
As every HPC system is different, we rely on the expierence of the local instructors to customize the code for their learners. 


