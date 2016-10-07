# aliases
alias ls='ls --color'
alias lsa='ls -a --color'
alias ii='explorer'
alias clear='cls'
alias now='curl www.timeapi.org/gmt/now'

alias gs='git status -sb'
alias gst='git stash'
alias gd='git diff'
alias ga='git add'
alias gpu='git push'
alias gpl='git pull'
alias gdc='git diff --cached'
alias gdt='git difftool'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gl='git lg'
alias gla='git lg --all'

alias st='launchexe "C:\Program Files (x86)\Atlassian\SourceTree\SourceTree.exe"'
alias vs12='launchexe "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"'
alias vs13='launchexe "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"'
alias vs15='launchexe "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"'
alias gx='launchexe "C:\Program Files (x86)\GitExtenions\GitExtensions.exe"'

function killssh() {
    cmd "/C C:\Users\ryan.morrin\Dropbox\Utils\cmder\bin\killssh.bat"
}

function launchexe() {
    (nohup "$@" &>/dev/null &)
}