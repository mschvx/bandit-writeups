#!/bin/bash

# Change start and end levels as needed
start=3
end=33

# Loop through levels
for ((i=start; i<=end; i++))
do
    folder=$(printf "Level-%02d" $i)
    mkdir -p "$folder"
    touch "$folder/$folder.md"
done
