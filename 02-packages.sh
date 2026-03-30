#!/bin/bash
# Author: sulabhkumar0710 (24BAI10961)
# Description: Detect package manager, check VLC installation, report version, and show philosophy notes.

# Function to detect OS and set package manager variables
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu|debian)
                pkg_manager="apt"
                pkg_name="vlc"
                ;;
            fedora)
                pkg_manager="dnf"
                pkg_name="vlc"
                ;;
            arch)
                pkg_manager="pacman"
                pkg_name="vlc"
                ;;
            *)
                pkg_manager="unknown"
                pkg_name="vlc"
                ;;
        esac
    else
        pkg_manager="unknown"
        pkg_name="vlc"
    fi
}

detect_os

# Check if VLC is installed using the appropriate command
is_installed=false
case "$pkg_manager" in
    apt)
        dpkg -s "$pkg_name" &>/dev/null && is_installed=true
        ;;
    dnf)
        rpm -q "$pkg_name" &>/dev/null && is_installed=true
        ;;
    pacman)
        pacman -Qi "$pkg_name" &>/dev/null && is_installed=true
        ;;
    *)
        command -v vlc &>/dev/null && is_installed=true
        ;;
esac

# Retrieve VLC version if installed
if $is_installed; then
    # 'vlc --version' prints a multi‑line header; the first line contains the version
    vlc_version=$(vlc --version 2>/dev/null | head -n1 | awk '{print $3}')
else
    vlc_version="Not installed"
fi

# Decorative output
printf "================================================================================\n"
printf "                   Vlc AUDIT - PACKAGE INSPECTOR                 \n"
printf "================================================================================\n"
if $is_installed; then
    printf "Status: %s is INSTALLED on this %s system.\n" "$pkg_name" "$ID"
else
    printf "Status: %s is NOT installed on this %s system.\n" "$pkg_name" "$ID"
fi
printf "Version: %s\n" "$vlc_version"
printf "--------------------------------------------------------------------------------\n"
printf "FOSS Philosophy Notes:\n"

# Case statement for philosophy notes of four tools
case "$pkg_name" in
    vlc)
        note_vlc="VLC embodies the principle of software freedom by providing a universal media player without DRM."
        ;;
esac
# Define notes for other tools (static)
note_git="Git enables collaborative development and transparent history, core to open source."
note_firefox="Firefox champions privacy and open standards on the web."
note_gimp="GIMP offers a free alternative to proprietary image editors, encouraging creative freedom."

printf " - VLC: %s\n" "$note_vlc"
printf " - Git: %s\n" "$note_git"
printf " - Firefox: %s\n" "$note_firefox"
printf " - GIMP: %s\n" "$note_gimp"
printf "================================================================================\n"
