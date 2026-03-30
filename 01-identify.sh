#!/bin/bash
# Author: sulabhkumar0710 (24BAI10961)
# Description: Extract system information and display an Open Source freedom message.

# Determine Linux distribution using /etc/os-release
if [ -f /etc/os-release ]; then
    # Source the file to get PRETTY_NAME variable
    . /etc/os-release
    distro="$PRETTY_NAME"
else
    distro="Unknown Distribution"
fi

# Kernel version
kernel=$(uname -r)

# Current logged‑in user
current_user=$(whoami)

# Home directory of the current user
home_dir=$HOME

# System uptime in a human readable format
uptime_info=$(uptime -p)

# Current date and time (exact as required)
current_date=$(date +"%a %b %d %Y %H:%M:%S %Z%z (Coordinated Universal Time)")

# Display the information with decorative borders
printf "================================================================================\n"
printf "                   Vlc AUDIT - SYSTEM IDENTITY                    \n"
printf "================================================================================\n"
printf "Linux Distribution: %s\n" "$distro"
printf "Kernel Version:     %s\n" "$kernel"
printf "Current User:       %s\n" "$current_user"
printf "Home Directory:     %s\n" "$home_dir"
printf "System Uptime:      %s\n" "$uptime_info"
printf "Current Date/Time:  %s\n" "$current_date"
printf "--------------------------------------------------------------------------------\n"
printf "Message: This system runs on Open Source software, providing freedom to study, change, and distribute.\n"
printf "================================================================================\n"
