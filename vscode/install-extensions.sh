#!/usr/bin/env bash
#
# Credit: http://www.growingwiththeweb.com/2016/06/syncing-vscode-extensions.html

EXTENSIONS=(
  "arcticicestudio.nord-visual-studio-code" \
  "dbaeumer.vscode-eslint" \
  "jchannon.csharpextensions" \
  "ms-vscode.csharp" \
)

for VARIANT in "code" \
               "code-insiders"
do
  if hash $VARIANT 2>/dev/null; then
    echo "Installing extensions for $VARIANT"
    for EXTENSION in ${EXTENSIONS[@]}
    do
      $VARIANT --install-extension $EXTENSION
    done
  fi
done