#!/bin/bash

read -p "Enter file name: " file_name
output_file="amazon_names.txt"

if [ -f "$file_name" ]; then
    awk -F ',' 'BEGIN { OFS = "," } {
        if (tolower($4) ~ /@amazon\.com/) {
            print $3 " " $2
        }
    }' "$file_name" > "$output_file"

    echo "Names have been written to $output_file"
else
    echo "File not found."
fi
