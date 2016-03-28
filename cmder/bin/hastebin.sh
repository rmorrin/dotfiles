#!/usr/bin/env bash
#
# Author: Ryan Morrin (github @rmorrin)
#
# Uploads contents of clipboard to hastebin, copies resulting url to clipboard.
#
# Inspired by:
#    http://www.linux-magazine.com/Online/Blogs/Productivity-Sauce/Hastebin-An-Open-Source-Alternative-to-Pastebin

# include cross-platform clipboard functions
. "$(dirname -- $0)/clippy.sh"

# colour escapes
cyan='\033[1;36m'
nocolour='\033[0m'

# grab clipboard contents & post to hastebin, parse returned key to create url
curl -X POST -s -d "$(getclip)" http://hastebin.com/documents | awk -F '"' '{print "http://hastebin.com/"$4}' | setclip

# store url for easy processing
url=$(getclip)

# boom, done! print some fancy coloured shit and url
echo -e "${cyan}${url//?/-}"
echo "$(getclip)"
echo -e "${url//?/-}${nocolour}"

echo "copied to clipboard!"
