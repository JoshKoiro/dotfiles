#!/bin/bash

# Read files for ASCII ascii_right
# Recommended website to generate ACII art is: https://www.asciiart.eu/
file1="$HOME/.bashrc.d/splashScreen/splash_graphic.txt"
file2="$HOME/.bashrc.d/splashScreen/splash_text.txt"

# Define the colors for left and right ASCII art
color_left="\e[35m"  # Green for splash_graphic
color_right="\e[34m" # Blue for splash_text
reset_color="\e[0m"  # Reset color

# Define the spacing between the two ASCII art pieces (can be negative)
spacing=-20 # You can adjust this to a negative number to bring the art closer

# Read the lines of each file into arrays
mapfile -t ascii_left <"$file1"
mapfile -t ascii_right <"$file2"

# Determine the height of each piece of ASCII art
height_left=${#ascii_left[@]}
height_right=${#ascii_right[@]}

# Calculate the maximum height of both ASCII art pieces
max_height=$((height_left > height_right ? height_left : height_right))

# Calculate the vertical padding needed to center each piece
pad_left=$(((max_height - height_left) / 2))
pad_right=$(((max_height - height_right) / 2))

# Output both pieces side by side, centered and colored
for ((i = 0; i < max_height; i++)); do
  # Print left ASCII art with padding if necessary
  if ((i >= pad_left && i < pad_left + height_left)); then
    printf "${color_left}%-50s${reset_color}" "${ascii_left[i - pad_left]}"
  else
    printf "%-50s" " "
  fi

  # Adjust spacing - if negative, strip characters from the end of the left art
  if ((spacing >= 0)); then
    printf "%${spacing}s" " "
  else
    # Strip characters from the left art if spacing is negative
    printf "\b%.0s" $(seq 1 $((-spacing)))
  fi

  # Print right ASCII art with padding if necessary
  if ((i >= pad_right && i < pad_right + height_right)); then
    echo -e "${color_right}${ascii_right[i - pad_right]}${reset_color}"
  else
    echo " "
  fi
done
