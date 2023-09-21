#!/bin/bash

if [ "$#" -ne 2 ]; then
	exit 1
fi

writefile="$1";
writestr="$2";

if [ -z "$writestr" ]; then
	exit 1
fi

directory=$(dirname "$writefile")
if [ ! -d "$directory" ]; then
	mkdir -p "$directory" || { echo "Error: Failed to create directory $directory"; exit 1; }
fi

echo "$writestr" > "$writefile" || { echo "Error: Failed to write to $writefile"; exit 1; }

echo "COntent written to $writefile"
exit 0
