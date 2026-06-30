//if using a shell script:

// Get the argument string passed from the command line


arg = getArgument()
print("Running batch analysis with arguments:")
print(arg)
args = split(arg, ",");

input_directory = args[0];
output_directory = args[1];


print("Input directory is: ", input_directory);
print("Output directory is: ", output_directory);

function strip(s) {
    while (startsWith(s, " "))
        s = substring(s, 1);

    while (endsWith(s, " "))
        s = substring(s, 0, lengthOf(s)-1);

    return s;
}

input_directory=strip(input_directory);
output_directory=strip(output_directory);

print("Input directory is: ", input_directory);
print("Output directory is: ", output_directory);