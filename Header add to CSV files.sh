#!/bin/bash

# Check for a folder path argument
if [ -z "$1" ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path="$1"

# Define the header with pipe symbols
header="SERIALNO|SEQUENCE|TIME_STAMP|SERVICEKEY|GTC2|GTC1"  # Adjust as needed

# Iterate through all .unl files in the folder
#for file_path in "$folder_path"/*.unl; do
for file_path in "$folder_path"/*.csv; do
    if [ -e "$file_path" ]; then
        # Add the header to each file using sed
        sed -i "1i $header" "$file_path"
        echo "Header added to $file_path"
    else
        echo "Warning: File not found - $file_path. Skipping..."
    fi
done
