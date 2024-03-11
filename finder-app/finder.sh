#!/bin/sh

filesdir="$1"
searchstr="$2"

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Insufficient arguments passed to the script."
    exit 1
fi

# Check if the directory name exists
if [ ! -d "$filesdir" ]; then
    echo "Error: The directory '$filesdir' does not exist."
    exit 1
fi

# Check the number of files and subdirectories in the given path
filescount=$(find "$filesdir" -type f | wc -l)

# Search for the given string inside files
for file in $(find "$filesdir" -type f); do
    matches=$(grep -o "$searchstr" "$file" | wc -l)
    total_matches=$((total_matches + matches))
done

#echo "Total matches for '$searchstr' in '$filesdir': $total_matches"

echo "The number of files are $filescount and the number of matching lines are $total_matches"



