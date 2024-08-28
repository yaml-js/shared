#!/bin/bash
set -e

# Program header
echo "Publishing all projects"

# Check if the JSON file is provided as an argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <projects.json>"
  exit 1
fi

# Assign the first argument to a variable
json_file=$1

# Check if the file exists
if [ ! -f "$json_file" ]; then
  echo "File not found: $json_file"
  exit 1
fi

# Read the content of the JSON file
projects=$(jq -r '.[]' "$json_file")

# Loop through each item in the array and run the build command
for item in $projects; do
  echo "Publishing $item"
  yarn workspace "$item" deploy
done

echo "Done."