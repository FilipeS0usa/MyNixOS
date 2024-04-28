#!/usr/bin/env bash

# initializing wallpaper daemon
swww-daemon &
# setting wallpaper
swww img ~/.config/Wallpapers/12.jpg &

# you can install this by adding
# pkgs.networkmanagerapplet to your packages
nm-applet --indicator &

# the bar
waybar &

# dunst
dunst
