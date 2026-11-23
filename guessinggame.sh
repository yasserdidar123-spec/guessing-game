#!/usr/bin/env bash
# File: guessinggame.sh

function get_file_count {
    ls -1 | wc -l
}

correct_count=$(get_file_count)
guess=-1

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

while [[ $guess -ne $correct_count ]]
do
    read -p "Enter your guess: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid positive number."
    elif [[ $guess -lt $correct_count ]]
    then
        echo "Your guess is too low. Try again!"
    elif [[ $guess -gt $correct_count ]]
    then
        echo "Your guess is too high. Try again!"
    else
        echo "Congratulations! You guessed the right number of files: $correct_count"
    fi
done
