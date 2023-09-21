#!/bin/bash

numfiles=10
writestr="AELD_IS_FUN"

if [ "$#" -ge 2 ]; then
	numfiles="$1"
	writestr="$2"
fi

mkdir -p /tmp/aeld-data || { echo "Error: Failed to create directory /tmp/aeld-data"; exit 1; } 

for ((i=1; i<=numfiles; i++)); do
	username=$(cat conf/username.txt)
	writefile="/tmp/aeld-data/${username}${i}.txt"
	./writer.sh "$writefile" "$writestr" || { echo "Error: Failed to create $writefile"; exit 1; }
done

output=$(./finder.sh --filesdir /tmp/aeld-data --searchstr "$writestr")

expected_output="THe number of files are $numfiles and number of matching lines are $numfiles"
if [ "$output" == "$expected_output" ]; then
	echo "success"
else
	echo "error"
fi
