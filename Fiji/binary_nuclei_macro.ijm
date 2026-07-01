/*
* Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
*
* Authors:
* Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
* Stefania Marcotti, Kimberly Meechan, John Roche, Todd 
*
* Create binary mask from a specified channel in a series of input images
*
* Repository:
* https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
*/


// IO initialisation
// Put the input and output directories here
//input_directory = "/camp/home/marcots/working/marcots/S-BIAD7/data/";
//output_directory = "/camp/home/marcots/working/marcots/S-BIAD7/output/";

//if using a shell script:

// Get the argument string passed from the command line
arg = getArgument();

// Extract variables from the argument string
args = split(arg, ",");

input_directory = args[0];
output_directory = args[1];


print("Input directory is: ", input_directory);
print("Output directory is: ", output_directory);

// Get the list of files in the input directory
images = getFileList(input_directory);

setBatchMode(true);

// Iterate over all files
print("There are this many images:", images.length);  //just a double check to make sure there are as many images as you thought
for (i = 0; i < images.length; i++) {
	print("Working on image:", i+1, " of : ", images.length );
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

print("All done!")
eval("script", "System.exit(0);");  //close the fiji instance when we're done, so we're not wasting resources. 
