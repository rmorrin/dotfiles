#!/usr/bin/env bash
#
# Credit: http://www.growingwiththeweb.com/2016/06/syncing-vscode-extensions.html

EXTENSIONS=(
  "amatiasq.sort-imports" \
  "Angular.ng-template" \
  "arcticicestudio.nord-visual-studio-code" \
  "christian-kohler.path-intellisense" \
  "eamodio.gitlens" \
  "EditorConfig.EditorConfig" \
  "eg2.vscode-npm-script" \
  "eriklynd.json-tools" \
  "esbenp.prettier-vscode" \
  "infinity1207.angular2-switcher" \
  "jchannon.csharpextensions" \
  "johnpapa.angular-essentials" \
  "johnpapa.Angular2" \
  "johnpapa.vscode-peacock" \
  "ms-vscode.csharp" \
  "ms-vscode.vscode-typescript-tslint-plugin" \
  "msjsdiag.debugger-for-chrome" \
  "natewallace.angular2-inline" \
  "nrwl.angular-console" \
  "PKief.material-icon-theme" \
  "qinjia.seti-icons" \
  "sdras.night-owl" \
  "stringham.move-ts" \
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