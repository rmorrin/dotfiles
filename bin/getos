#!/usr/bin/env bash
#
# Author: Ryan Morrin (github @rmorrin)
#
# Returns OS of the current machine (Mac, Linux or Windows).
# Useful when writing cross-platform scripts.
#
# Credit:
#     http://stackoverflow.com/a/17072017

if [ "$(uname)" == "Darwin" ]; then
    echo Mac
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo Linux
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo Windows
fi
