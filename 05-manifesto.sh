#!/bin/bash
# Author: sulabhkumar0710 (24BAI10961)
# Description: Interactive script that builds a personalized open‑source manifesto.

# Prompt the user for three pieces of information
read -p "1) What is your favorite open‑source project? " fav_project
read -p "2) Why do you support open source? " reason
read -p "3) What is your personal goal related to open source? " goal

# Construct a paragraph using the supplied answers
manifesto="As a passionate advocate of open source, I hold $fav_project close to my heart. $reason. My personal goal is to $goal, contributing to the vibrant community that fuels innovation."

# Define the output file name based on the current user
output_file="${USER}_manifesto.txt"

# Append the manifesto to the file, creating it if it does not exist
{
    echo "----- Manifesto generated on $(date) -----"
    echo "$manifesto"
    echo ""
} >> "$output_file"

# Inform the user of the successful operation
printf "Manifesto has been appended to %s\n" "$output_file"
