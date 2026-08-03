#!/bin/bash
#easy hello world script

echo "What do you like to be called?" #the echo command is used to display a message to the user
read name                 #the read command is used to take input from the user and store it in the variable 'name'
echo "Hello, $name!"      #Variables are called with a $ sign in front of them.  In this case, the variable 'name' is being called and its value is being displayed to the user.


todays_date=$(date) #the date command is used to get the current date and time, and it is being stored in the variable 'todays_date'
echo "The data and time is: $todays_date" #the value of the variable 'todays_date' is being displayed to the user
