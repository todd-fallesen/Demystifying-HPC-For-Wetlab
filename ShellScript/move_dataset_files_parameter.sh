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


# --------------------------------------------------
# 3. Loop over all TIFF files in the source directory
# --------------------------------------------------

for f in "$SRC_DIR"/*.tiff; do                                       #This is a for loop that iterates over all files in the source directory that have a .tiff extension.  The variable $f will hold the full path to each file as the loop iterates.

    # Get just the filename (remove the path)
    filename=$(basename "$f")                                        #This is the filename without the path.  The basename command extracts the filename from a full path.


    # --------------------------------------------------
    # 4. Check if the filename contains RepX_DIVY
    #    Example match: Rep1_DIV7
    # --------------------------------------------------

    if echo "$filename" | grep -q "Rep[0-9]*_DIV[0-9]*"; then          #This line checks if the filename contains the pattern "RepX_DIVY", where X and Y are numbers.  The grep command searches for the pattern in the filename, and the -q option tells grep to operate in quiet mode, meaning it will not output anything to the terminal.  If the pattern is found, the if statement evaluates to true, and the code inside the if block will be executed.

        # Extract the RepX_DIVY part
        image_set=$(echo "$filename" | grep -o "Rep[0-9]*_DIV[0-9]*")  #This line uses grep with the -o option to extract the part of the filename that matches the pattern "Rep[0-9]*_DIV[0-9]*".  The -o option tells grep to only output the matching part of the string, rather than the entire line.  The pattern "Rep[0-9]*_DIV[0-9]*" matches any string that starts with "Rep", followed by one or more digits, then "_DIV", followed by one or more digits.

        # Extract RepX from RepX_DIVY
        rep=$(echo "$image_set" | cut -d "_" -f 1)                      #This line extracts the RepX part from the RepX_DIVY string.  The cut command is used to split the string based on the underscore (_) delimiter, and -f 1 specifies that we want the first field (RepX).


        # --------------------------------------------------
        # 5. Create the folders and move the file
        # --------------------------------------------------

        mkdir -p "$DEST_DIR/$rep/$image_set"                            #Create the destination directory for the specific RepX and DIVY combination.  The -p flag ensures that no error is thrown if the directory already exists, and it will also create any necessary parent directories.
        mv "$f" "$DEST_DIR/$rep/$image_set/"                            #Move the file to the new directory.  The mv command moves files or directories from one location to another.

    fi
done
#to run bash move_dataset_files_parameter.sh path/to/images path/to/output