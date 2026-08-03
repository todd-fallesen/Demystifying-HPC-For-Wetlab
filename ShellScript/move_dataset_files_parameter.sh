#!/usr/bin/env bash

# Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
#
# Authors:
# Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
# Stefania Marcotti, Kimberly Meechan, John Roche, Todd Fallesen
#
# Repository:
# https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
## This shell script works in the same method as move_dataset_files_hardcode, but allows uses to call the script with arguments for the input and output paths
## To use, run bash move_dataset_files_parameter.sh path/to/images path/to/output

SRC_DIR="$1"            # The first argument to the script, which should be the path to the source directory containing the TIFF files.
DEST_DIR="$2"           # The second argument to the script, which should be the path to the destination directory where the sorted files will be moved.

if [[ -z "$SRC_DIR" || -z "$DEST_DIR" ]]; then                  #This if statement checks if either the source directory or the destination directory is empty (i.e., not provided as arguments).  The -z operator checks if a string is empty.  If either variable is empty, the script will print a usage message and exit with a status code of 1, indicating an error.
    echo "Usage: $0 <source_directory> <destination_directory>" # Print usage message if arguments are missing
    exit 1                                                      #Exit if the arguments are not provided, indicating an error.
fi

mkdir -p "$DEST_DIR"                                            #This line creates the destination directory if it doesn't already exist.  The -p flag ensures that no error is thrown if the directory already exists, and it will also create any necessary parent directories.

for f in "$SRC_DIR"/*.tiff; do                                  #This is a for loop that iterates over all files in the source directory that have a .tiff extension.  The variable $f will hold the full path to each file as the loop iterates.
    filename="$(basename "$f")"                                 #This is the filename without the path.  The basename command extracts the filename from a full path.   

    if [[ $filename =~ ^(Rep[0-9]+)_(DIV[0-9]+)_ ]]; then       #This if statement uses a regular expression to check if the filename matches the pattern "RepX_DIVY_", where X and Y are numbers.  The =~ operator is used for regex matching in bash.  If the filename matches the pattern, the code inside the if block will be executed.
        rep="${BASH_REMATCH[1]}"                                #This line extracts the first captured group from the regex match, which corresponds to "RepX".  The BASH_REMATCH array holds the results of the regex match, with index 0 being the entire match and subsequent indices corresponding to captured groups.
        div="${BASH_REMATCH[2]}"                                #This line extracts the second captured group from the regex match, which corresponds to "DIVY".  The BASH_REMATCH array holds the results of the regex match, with index 0 being the entire match and subsequent indices corresponding to captured groups.
        subfolder="${rep}_${div}"                               #This line constructs the subfolder name by combining the extracted "RepX" and "DIVY" values with an underscore.

        mkdir -p "$DEST_DIR/$rep/$subfolder"                    #Create the destination directory for the specific RepX and DIVY combination.  The -p flag ensures that no error is thrown if the directory already exists, and it will also create any necessary parent directories.
        mv "$f" "$DEST_DIR/$rep/$subfolder/"                    #Move the file to the new directory.  The mv command moves files or directories from one location to another.
    fi
done

#to run bash move_dataset_files_parameter.sh path/to/images path/to/output