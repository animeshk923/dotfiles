#!/bin/bash

# Loop through all .js files in the current directory
for file in *.cpp; do
    # Check if it's a file
    if [[ -f "$file" ]]; then
        # Rename the file (add a prefix or any modification)
        mv "$file" "$file.js"
    fi
done

