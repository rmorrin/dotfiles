#!/usr/bin/env bash

sln=$(ls -a | grep -E '\.sln')


if [ -n "$sln" ]; then
	"C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "${sln}" &
else
	echo "No solution found in current directory"
fi
