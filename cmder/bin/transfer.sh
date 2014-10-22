#!/usr/bin/env bash

# upload file, grab returned url
OUTPUT=$(curl -s --upload-file $1 https://transfer.sh/${1##*[/|\\]})

# copy url to clipboard
echo ${OUTPUT} | clip

# boom!
echo -e "File available @ \033[1;36m${OUTPUT}\033[0m - copied to clipboard!"