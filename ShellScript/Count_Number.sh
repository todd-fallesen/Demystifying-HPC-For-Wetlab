#!/bin/bash

# Prompt user for a number
echo "Enter a number between 1 and 10: "    #prompt the user to enter a number between 1 and 10
read num                                    #the read command is used to take input from the user and store it in the variable 'num'

# Check if the number is between 1 and 10
if [[ $num -ge 1 && $num -le 10 ]]; then    #the if statement checks if the value of 'num' is greater than or equal to 1 and less than or equal to 10. The then keyword indicates the start of the if statement's body
                                            #ge stands for "greater than or equal to" and le stands for "less than or equal to".  The && operator is used to combine two conditions, and both conditions must be true for the if statement to execute its body.
    echo "Valid number: $num"
    # Loop to print each number from 0 to the entered number
    for ((i=0; i<=num; i++)); do            #this for loop will iterate from 0 to the value of 'num'. The do keyword indicates the start of the loop's body, and the done keyword indicates the end of the loop's body.
        echo $i
    done
else
    echo "Error: Please enter a number between 1 and 10."
    exit 1
fi                                      #fi ends an if statement.  fi is just 'if' spelled backwards.  It is used to indicate the end of an if statement.
