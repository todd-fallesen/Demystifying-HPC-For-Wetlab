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
 
// PARAMETERS //
channels = 1;
slices = 451;
frames = 131;

time_downsample = 2; 
Z_downsample = 10;

// IO initialisation
input_directory = "/camp/home/marcots/working/marcots/IDR0051/Processed Image Files/";
output_directory = "/camp/home/marcots/working/marcots/IDR0051/";

setBatchMode(true);

// import as image sequence
File.openSequence(input_directory);
title = getTitle();

// rearrange stack
run("Stack to Hyperstack...", "order=xyczt(default) channels="+channels+" slices="+slices+" frames="+frames+" display=Color");

// downsample in space and time
run("Make Subset...", "slices=1-"+slices+"-"+Z_downsample+" frames=1-"+frames+"-"+time_downsample);

// save
saveAs("Tiff", output_directory+title+"_downsampled.tif");

// close all
run("Close All");

setBatchMode(false);