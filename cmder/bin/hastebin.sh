#!/usr/bin/env bash
#
# Uploads contents of clipboard to hastebin, copies resulting url to clipboard.
# 
# Inspired by:
#    http://www.linux-magazine.com/Online/Blogs/Productivity-Sauce/Hastebin-An-Open-Source-Alternative-to-Pastebin

# colour escapes
cyan='\033[1;36m'
nocolour='\033[0m'

# grab clipboard contents & post to hastebin, parse returned key to create url
curl -X POST -s -d "$(cat /dev/clipboard)" http://hastebin.com/documents | awk -F '"' '{print "http://hastebin.com/"$4}' > /dev/clipboard

# store url for easy processing
url=$(cat /dev/clipboard)

# boom, done! print some fancy coloured shit and url
echo -e "${cyan}${url//?/-}"
echo "$(cat /dev/clipboard)"
echo -e "${url//?/-}${nocolour}"

echo "copied to clipboard!"
