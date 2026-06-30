/*
 * Demystify HPC
 * 
 * Author: Stefania Marcotti (stefania.marcotti@crick.ac.uk)
 * 
 * Create binary mask from a specified channel in a series of input images
 * 
 * CC-BY-SA-4.0 license: creativecommons.org/licenses/by-sa/4.0/
 * 
 */

// IO initialisation
// Put the input and output directories here
input_directory = "/camp/home/marcots/working/marcots/S-BIAD7/data/";
output_directory = "/camp/home/marcots/working/marcots/S-BIAD7/output/";

// Get the list of files in the input directory
images = getFileList(input_directory);

setBatchMode(true);

// Iterate over all files
for (i = 0; i < images.length; i++) {

	// Open image
	open(input_directory+images[i]);
	
	// Z-project
	run("Z Project...", "projection=[Max Intensity]");
	
	// Duplicate nuclear channel
	run("Duplicate...", "duplicate channels=1");
	
	// Smooth with Gaussian blur
	run("Gaussian Blur...", "sigma=5");
	
	// Segment
	setAutoThreshold("Otsu dark");
	setOption("BlackBackground", true);
	run("Convert to Mask");
	
	// Save output binary masks
	saveAs("Tiff", output_directory+"binary_"+images[i]);
	
	// Close all open images
	run("Close All");
	
}

setBatchMode(false);
