#!/usr/bin/env bash
#
# Author: Ryan Morrin (github @rmorrin)
#
# Cross-platform interface for copying text to/from the system clipboard
#
# Usage:
#  $ echo "$(getclip)" > somefile.txt
#  $ curl -X POST -d "$(getclip)" http://example.com/path/to/resource
#
#  $ echo "copy this to the clipboard" | setclip
#  $ tail -n 100 logfile.txt | setclip

os="$(./getos.sh)"

getclip () {
    if [ "$os" = "Mac" ]; then
        echo "$(pbpaste)"
    elif [ "$os" = "Linux" ]; then
        echo "$(xclip -o -sel c)"
    elif [ "$os" = "Windows" ]; then
        cat /dev/clipboard
    fi
}

setclip () {
    if [ -t 0 ]; then
        return 1
    else
        while read data; do
            if [ "$os" = "Mac" ]; then
                echo "$data" | pbcopy
            elif [ "$os" = "Linux" ]; then
                echo "$data" | xclip -sel c
            elif [ "$os" = "Windows" ]; then
                echo "$data" > /dev/clipboard
            fi
        done
    fi
}
