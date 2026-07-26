# Shell scripts

This is an example of teaching basic shell scripts, using the [Carpentries Unix Shell example data](https://swcarpentry.github.io/shell-novice/index.html#download-files).

## What are shells scripts?

So far we have been typing commands into the shell one-by-one, and examining their output. This works, but if we want to repeat these steps on another dataset, or after closing and re-opening the shell, we have to type them all over again.

We need a way to save these steps and re-run them at will. This is where shell scripts come in - they are a way of recording commands in a re-useable way. This will save us time going forward, and help to make our analysis steps more reproducible.

## Our first script

Let's navigate to the `shell-lesson-data/exercise-data/alkanes` directory in our terminal.

Here, there is a series of `.pdb` files containing information about different 'alkane' molecules.

Let's make a shell script called `analyse.sh` to hold our analysis steps:
```
nano analyse.sh
```

Let's say the first step is to extract the first 5 lines of the `.pdb` file. To do this for `octane.pdb`, add the following line to the script:
```
head -n 5 octane.pdb
```

After saving the file, we can run this from the terminal with:
```
bash analyse.sh
```
and see the first 5 lines printed out.

## Using command-line arguments

We can generalise our script to run on any file by adding command-line arguments. Open the script again in nano and modify the command to:
```
head -n 5 "$1"
```

Here `$1` refers to the first argument we give on the command line. So e.g. running it with:
```
bash analyse.sh octane.pdb
```
will run it for octane as before. But we can add any filename we like:
```
bash analyse.sh ethane.pdb
```

## Comments

It's good practise to add comments to your bash scripts to explain what they do. This makes the code easier to interpret (for yourself, and for others if you share the script).

In nano, update the script to:
```
# Extract the first 5 lines of the file
head -n 5 "$1"
```
Comments always start with `#`. If you run this script you will see that nothing has changed - comments don't run any extra code, they are just there to help explain the steps.

## Saving results to a file

Let's add a few more commands to save our output to a chosen file. Open it with nano and update it to:

```
# Run with: bash analyse.sh input_filename output_filename

# make a new directory for results
mkdir -p results/

# Write the first 5 lines to the given filename
head -n 5 "$1" > results/"$2"
```
We now have two command-line arguments. `$1` is the name of our input file, and `$2` is the name of our output file.

We can run it with e.g.:
```
bash analyse.sh octane.pdb octane-results.txt
```
or for another file:
```
bash analyse.sh ethane.pdb ethane-results.txt
```

All our results are being written neatly to the `results` directory. 

Here, we have only included a few example commands - but you could expand `analyse.sh` to contain any number of analysis steps.