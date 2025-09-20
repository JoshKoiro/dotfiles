#!/bin/bash

get_better_random() {
  local max=$1
  # Use /dev/urandom for better randomization
  # od -An -N4 -i gives us a true random number
  # we then use abs() and modulo to get within our range
  local rand=$(od -An -N4 -i /dev/urandom | tr -d ' ')
  echo $(((rand < 0 ? -rand : rand) % max + 1))
}

get_seeded_random() {
  local max=$1
  # Seed random with nanosecond precision time
  RANDOM=$(date +%N)
  echo $((RANDOM % max + 1))
}

# Check if a filename was provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide a filename as an argument."
  exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Count the number of lines in the file
num_lines=$(wc -l <"$filename")

# Choose which random method to use
# Method 1: Using /dev/urandom (better randomization)
random_line=$(get_better_random "$num_lines")

# Method 2: Using seeded RANDOM (alternative approach)
# random_line=$(get_seeded_random "$num_lines")

# Extract and print the random line
sed -n "${random_line}p" "$filename"
