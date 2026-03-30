#!/bin/bash
# Author: sulabhkumar0710 (24BAI10961)
# Description: Analyze a VLC log file for a given keyword, count occurrences, and display the last five matches.

# Verify that a log file path was supplied
if [ -z "$1" ]; then
    echo "Usage: $0 <log_file_path> <keyword>"
    exit 1
fi

log_file="$1"
keyword="${2:-}"

# Suggest a realistic VLC log location (comment for documentation)
# Typical VLC logs can be found under /var/log/vlc/ or in the user's home directory ~/.config/vlc/logs/

# Ensure the log file exists and is readable
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' does not exist."
    exit 2
fi

# Initialize counters and an array to hold matching lines
match_count=0
declare -a matches

# Read the log file line‑by‑line
while IFS= read -r line; do
    # If a keyword was provided, filter lines containing it; otherwise accept all lines
    if [ -n "$keyword" ]; then
        echo "$line" | grep -q "$keyword" && {
            ((match_count++))
            matches+=("$line")
        }
    else
        ((match_count++))
        matches+=("$line")
    fi
done < "$log_file"

# Output the results
printf "================================================================================\n"
printf "                   Vlc AUDIT - LOG ANALYZER                     \n"
printf "================================================================================\n"
printf "Log file examined : %s\n" "$log_file"
if [ -n "$keyword" ]; then
    printf "Keyword searched  : %s\n" "$keyword"
fi
printf "Total matching lines: %d\n" "$match_count"
printf "--------------------------------------------------------------------------------\n"

# Print the last five matching entries, if any
if [ "$match_count" -gt 0 ]; then
    printf "Last 5 matching entries:\n"
    # Use printf to display each line
    for ((i=${#matches[@]}-5; i<${#matches[@]}; i++)); do
        [ $i -ge 0 ] && printf "%s\n" "${matches[i]}"
    done
else
    printf "No matching entries found.\n"
fi
printf "================================================================================\n"
