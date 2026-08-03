#!/bin/bash

if [ -n "$1" ]; then  #the -n option is used to check if the string is not null.  The $1 variable is used to get the first argument passed to the script.  If the first argument is not null, then the value of the first argument is stored in the variable 'name'.
    name="$1"
    echo "Hello, $name!" 
else
    echo "What do you like to be called?" #the echo command is used to display a message to the user
    read name                 #the read command is used to take input from the user and store it in the variable 'name'
    echo "Hello, $name!"      #Variables are called with a $ sign in front of them.  In this case, the variable 'name' is being called and its value is being displayed to the user.
fi  #the fi command is used to end the if statement. it is just the word 'if' spelled backwards.  

todays_date=$(date) #the date command is used to get the current date and time, and it is being stored in the variable 'todays_date'
echo "The data and time is: $todays_date" #the value of the variable 'todays_date' is being displayed to the user
