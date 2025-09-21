#!/bin/bash

# Default color if no --color flag is provided
LOGO_COLOR="default"
IMAGE_PATH=""

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
  --color)
    if [[ -n "$2" ]]; then
      LOGO_COLOR="$2"
      shift # move past the value
    else
      echo "Error: --color requires a non-empty value." >&2
      exit 1
    fi
    ;;
  *)
    # Assume any other argument is the image path
    if [[ -z "$IMAGE_PATH" ]]; then
      IMAGE_PATH="$1"
    else
      echo "Error: Only one image path can be specified." >&2
      exit 1
    fi
    ;;
  esac
  shift # move to the next key or value
done

# Check if an image path was provided
if [[ -z "$IMAGE_PATH" ]]; then
  echo "Usage: $0 <path_to_image> [--color <color_name>]"
  echo "Example: $0 my_logo.png --color blue"
  exit 1
fi

# Run the command
# The --logo-color option in fastfetch sets the color for the logo.
# Available colors include: black, red, green, yellow, blue, magenta, cyan, white, and default.
clear && jp2a --width=40 "$IMAGE_PATH" | fastfetch --logo - --logo-color-1 "$LOGO_COLOR"
