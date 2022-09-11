#!/bin/bash

# Script to setup an android build environment on Arch Linux and derivative distributions

clear
echo 'Starting Arch-based Android build setup'

# Sync, update, and prepare system
echo '[1/3] Syncing repositories and updating system packages'
sudo pacman -Syyu --noconfirm --needed multilib-devel

# Install android build prerequisites
echo '[2/3] Installing Android building prerequisites'
yay -S --noconfirm --needed --mflags "--skippgpcheck" ncurses5-compat-libs lib32-ncurses5-compat-libs aosp-devel xml2 lineageos-devel

# Install adb and associated udev rules
echo '[3/3] Installing adb convenience tools'
sudo pacman -Sy --noconfirm --needed android-tools android-udev
# Repo
echo "Installing Git Repository Tool"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

echo 'Setup completed, enjoy'
