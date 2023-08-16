#!/bin/bash

read -p "Enter file name: " file_name
output_file="amazon_names.txt"

if [ -f "$file_name" ]; then
    ans=()
    while IFS=',' read -r first_name last_name email; do
        if [[ "$email" == *"@amazon.com"* ]]; then
            ans+=("$first_name $last_name")
        fi
    done < "$file_name"

    for name in "${ans[@]}"; do
        echo "$name" >> "$output_file"
    done

    echo "Names have been written to $output_file"
else
    echo "File not found."
fi
