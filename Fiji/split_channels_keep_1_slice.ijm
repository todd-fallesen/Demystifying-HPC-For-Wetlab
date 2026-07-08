/*
* Demystifying HPC: Empowering Life Scientists in HPC use for BioImage Analysis
*
* Authors:
* Camille Charoy, Ruaridh Gollifer, Camilla Harris, Courtney Hopf,
* Stefania Marcotti, Kimberly Meechan, John Roche, Todd 
*
* This script splits tiff files into channels and keeps just the first slice.
*
* Repository:
* https://github.com/todd-fallesen/Demystifying-HPC-For-Wetlab
*/

//#@ File (label = "Input directory", style = "directory") input   //uncomment these lines if you want to run this as gui macro
//#@ File (label = "Output directory", style = "directory") output
//#@ String (label = "File suffix", value = ".tif") suffix


// IO initialisation
// Get the argument string passed from the command line
arg = getArgument();

// Extract variables from the argument string
args = split(arg, ",");

input = args[0]; 					//this is the input directory
output = args[1];					//this is the output directory
suffix = ".tiff";					//this is the suffix

print("Input Directory is: ", input);
print("Output directory is: ", output);

setBatchMode(true);


processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	// Do the processing here by adding your own code.
	// Leave the print statements until things work, then remove them.
	
	open(input + File.separator + file);
	selectWindow(file);

	run("Make Substack...", "slices=1"); //keep only the first slice
	run("Split Channels");
	for (i=0;i<nImages;i++) {
		print("there are: ", nImages, " channel images");
        selectImage(i+1);
        title = getInfo("image.title");
        print("this is the title: ", title);
        //ids[i]=getImageID;

        //saveAs("tiff", output+File.separator+title);
		saveAs("tiff", output+File.separator+title);
	} 
	run("Close All");

}

// close all
run("Close All");

setBatchMode(false);

print("All done!")
eval("script", "System.exit(0);");  //close the fiji instance when we're done, so we're not wasting resources. 
