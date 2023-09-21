#!/bin/bash

# Default values
filesdir="/tmp/aeld-data"
searchstr=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --filesdir)
            filesdir="$2"
            shift
            shift
            ;;
        --searchstr)
            searchstr="$2"
            shift
            shift
            ;;
        *)
            # Unknown option
            echo "Error: Unknown option: $1"
            exit 1
            ;;
    esac
done

# Check if the search string is specified
if [ -z "$searchstr" ]; then
    echo "Error: The search string (--searchstr) is not specified."
    exit 1
fi

# Check if the files directory exists
if [ ! -d "$filesdir" ]; then
    echo "Error: The specified files directory '$filesdir' does not exist."
    exit 1
fi

# Search for the search string in files within the directory
match_count=$(grep -rl "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $(ls "$filesdir" | wc -l) and the number of matching lines are $match_count"
