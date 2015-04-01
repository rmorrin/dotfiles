#!/usr/bin/env bash

sln=$(ls -a | grep -E '\.sln')


if [ -n "$sln" ]; then
	if [ "$1" == "--vs12" ]; then
		"C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe" "${sln}" &
	elif [ "$1" == "--vs15" ]; then
		"C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" "${sln}" &
	else
		"C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "${sln}" &
	fi
else
	echo "No solution found in current directory"
fi
