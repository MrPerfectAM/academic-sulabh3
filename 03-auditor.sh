#!/bin/bash
# Author: sulabhkumar0710 (24BAI10961)
# Description: Audit selected directories, reporting size, permissions, and owner.

# Base directories to audit
dirs=(
    "/etc"
    "/var/log"
    "/usr/share/vlc"
    "/etc/vlc"
)

# Dynamically append two VLC‑specific paths
dirs+=("/usr/lib/vlc")
dirs+=("/var/lib/vlc")

# Header
printf "================================================================================\n"
printf "                   Vlc AUDIT - DISK AND PERMISSION AUDITOR       \n"
printf "================================================================================\n"
printf "%-30s %-10s %-12s %s\n" "Directory" "Size(KB)" "Permissions" "Owner"
printf "--------------------------------------------------------------------------------\n"

# Loop through each directory
for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        # Use 'du' to get total size in kilobytes, 'stat' for permissions and owner
        size_kb=$(du -sk "$dir" 2>/dev/null | cut -f1)
        # 'stat' with format: %A = permissions, %U = owner
        perm_owner=$(stat -c "%A %U" "$dir")
        # Split permissions and owner
        perm=$(echo "$perm_owner" | awk '{print $1}')
        owner=$(echo "$perm_owner" | awk '{print $2}')
        printf "%-30s %-10s %-12s %s\n" "$dir" "$size_kb" "$perm" "$owner"
    else
        printf "%-30s %-10s %-12s %s\n" "$dir" "N/A" "N/A" "N/A"
    fi
done

printf "================================================================================\n"
