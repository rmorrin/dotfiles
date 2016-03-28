#!/usr/bin/env bash

# include cross-platform clipboard functions
. "$(dirname -- $0)/clippy.sh"

# upload file, grab returned url
output=$(curl -s --upload-file $1 https://transfer.sh/${1##*[/|\\]})

# copy url to clipboard
echo "${output}" | setclip

# boom!
echo -e "File available @ \033[1;36m${output}\033[0m - copied to clipboard!"
