# Course structure with Carpentries Links:

The overall structure of the course is based on an abridged version of two Carpentries courses:
- [The Unix Shell](https://swcarpentry.github.io/shell-novice/01-intro.html)
- [Using High-Performance Computing Systems](https://carpentries-incubator.github.io/hpc-intro/)

Here we provide links to the specific sections we recommend using, as well as examples of where you could integrate [the software tracks](../README.md#software-tracks). 

Don't feel like you have to use all the Carpentries material - we regularly skip sections that are less relevant for our students, and choose a handful of the exercises to do together (rather than all of them).

## Part 1 - Introduction to the Unix Shell

For this part, learners get familiar with using the unix shell on their own laptops, before moving to the HPC system in Part 2.

### Setup

- [Carpentries instructions for shell setup.](https://carpentries.github.io/workshop-template/install_instructions/#shell)
We recommend using the 'git for Windows' instructions for Windows.

- [Example data download](https://swcarpentry.github.io/shell-novice/index.html#download-files). Carpentries provides some example data that can be used for exercises in this section. If you'd prefer more imaging-focused examples, you can instead use a small selection of files from [the example data](../README.md#demonstration-images).

### Differences between GUI and CLI, and introduction to the shell

- [Episode 1: 'Introducing the Shell'](https://swcarpentry.github.io/shell-novice/01-intro.html)

### Navigating files and directories

- [Episode 2: 'Navigating Files and Directories'](https://swcarpentry.github.io/shell-novice/02-filedir.html)

### Working with files and directories

- [Episode 3: 'Working With Files and Directories'](https://swcarpentry.github.io/shell-novice/03-create.html)

### Running a shell script

The Carpentries' Unix Shell lesson, has sections on writing shell scripts e.g. [Episode 6: 'Shell Scripts'](https://swcarpentry.github.io/shell-novice/06-script.html), but we find this goes into more detail than required.

Instead, we've created a short [example lesson](./shell_script_example.md) demonstrating a simple shell script.

## Part 2 - Introduction to HPC

In this section, learners move on to using your institution's HPC system. This is also where we will start using examples from the software tracks (although feel free to integrate them earlier if you'd prefer).

### Why use a cluster?

- [Episode 1: 'Why use a Cluster?'](https://carpentries-incubator.github.io/hpc-intro/10-hpc-intro.html)

This is a good point to introduce the software track you will be using for the rest of the course. Emphasising the advantages of running that specific workflow on HPC rather than locally e.g. the ability to process many samples in parallel, or work with very large images.

It can also be useful to briefly introduce the structure of an HPC cluster at this stage. For this, the 'Nodes' and 'What's in a Node?' sections of [Episode 3: 'Working on a remote HPC system'](https://carpentries-incubator.github.io/hpc-intro/12-cluster.html) are useful.

### Connecting to a remote HPC system

- [Episode 2: 'Connecting to a remote HPC system'](https://carpentries-incubator.github.io/hpc-intro/11-connecting.html)

### Exploring remote resources

- [Episode 3: 'Working on a remote HPC system'](https://carpentries-incubator.github.io/hpc-intro/12-cluster.html)

This is a good point to explore the example data for the selected software track on the HPC, using commands like `pwd` / `cd` / `ls` etc.

We also encourage, whichever software track you choose, to introduce running shell scripts on the HPC via [`move_dataset_files_hardcode.sh`](../cellprofiler/move_dataset_files_hardcode.sh) and [`move_dataset_files_parameter.sh`](../cellprofiler/move_dataset_files_parameter.sh) found in the cellprofiler section. These scripts organise the `ExperimentA_Split_Channels` example data into multiple directories based on their filenames - first via hardcoded input / output paths, and then via command-line arguments.  

### Transferring files with remote computers

- [Episode 7: 'Transferring files with remote computers'](https://carpentries-incubator.github.io/hpc-intro/16-transferring-files.html)

Here, learners can practice transferring a small number of the provided example image files off the cluster to their local machine and vice versa.

### Scheduler fundamentals

- [Episode 4: 'Scheduler fundamentals'](https://carpentries-incubator.github.io/hpc-intro/13-scheduler.html)

Here, instructors would walk students through submitting the scripts for their chosen software track - Fiji, Python or CellProfiler. For example, submitting the job with `sbatch`, monitoring it in the queue, and changing requested resources by modifying any `#SBATCH` lines.

### Accessing software via modules

- [Episode 6: 'Accessing software via Modules'](https://carpentries-incubator.github.io/hpc-intro/15-modules.html)

Here, instructors can also highlight examples of module use in their chosen software track (where possible). For example, both the CellProfiler and Python scripts load a module for Anaconda.

## Part 3 - Being a good HPCitizen

This part focuses on how to effectively and responsibly use HPC resources.

- [Episode 9: 'Using resources effectively'](https://carpentries-incubator.github.io/hpc-intro/18-resources.html)
- [Episode 10: 'Using shared resources responsibly'](https://carpentries-incubator.github.io/hpc-intro/19-responsibility.html)





