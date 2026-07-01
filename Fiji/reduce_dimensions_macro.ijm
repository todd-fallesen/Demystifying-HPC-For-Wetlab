/*
* Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
*
* Authors:
* Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
* Stefania Marcotti, Kimberly Meechan, John Roche, Todd 
*
* This script downsamples by Z, time, and x and y
*
* Repository:
* https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
*/




/*
 * Demystify HPC
 * 
 * Author: Stefania Marcotti (stefania.marcotti@crick.ac.uk)
 * 
 * Downsample dataset in Z and time
 * 
 * CC-BY-SA-4.0 license: creativecommons.org/licenses/by-sa/4.0/
 * 
 */
 
//Downsample parameters
time_downsample = 2; 
Z_downsample = 10;
xscale = 0.25;  //downsample by half (will give you a quarter the size image)
yscale = 0.25;

// IO initialisation
// Get the argument string passed from the command line
arg = getArgument();

// Extract variables from the argument string
args = split(arg, ",");

input_image = args[0];
output_directory = args[1];


print("Input image is: ", input_image);
print("Output directory is: ", output_directory);

setBatchMode(true);

// open image
open(input_image);
title = getTitle();
Stack.getDimensions(width, height, channels, slices, frames);
print("There are : ", channels, " channels, ", slices, " : slices and ", frames, " : frames");

// downsample in space and time and x/y
run("Make Subset...", "slices=1-"+slices+"-"+Z_downsample+" frames=1-"+frames+"-"+time_downsample);

getDimensions(width,height,channels,slices,frames);
newWidth  = floor(width*xscale);
newHeight = floor(height*yscale);

run("Size...", "width="+newWidth+" height="+newHeight+" depth="+slices+" average interpolation=Bilinear");


// save
saveAs("Tiff", output_directory+title+"_downsampled.tif");

// close all
run("Close All");

setBatchMode(false);

print("All done!")
eval("script", "System.exit(0);");  //close the fiji instance when we're done, so we're not wasting resources. 