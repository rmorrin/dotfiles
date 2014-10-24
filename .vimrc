set backspace=indent,eol,start                  " make that backspace key work the way it should
filetype indent on                              " activates indenting for files
set autoindent                                  " auto indenting
set number                                      " line numbers
set nobackup                                    " get rid of anoying ~file
set laststatus=2                                " make the last line where the status is two lines deep so you can see status always
set paste
set ignorecase
set smartcase
set incsearch                                   " search as you key in
set softtabstop=4                               " tab size
set shiftwidth=4                                " column width
set expandtab                                   " Tab to space
set ai                                          " set auto-indenting on for programming
set showmatch                                   " automatically show matching brackets. works like it does in bbedit.
set vb                                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                                       " show the cursor position all the time
set nocompatible                                " vi compatible is LAME
set background=dark                             " Use colours that work well on a dark background (Console is usually black)
set showmode                                    " show the current mode
syntax on                                       " turn syntax highlighting on by default

fun! SetColours()
    set term=xterm                      "
    set t_Co=256                        "
    let &t_AB="\e[48;5;%dm"             "
    let &t_AF="\e[38;5;%dm"             "
    colorscheme Tomorrow-Night-Eighties "
endfun

" use default colours when editing git commit messages
autocmd BufNewFile,BufRead,BufEnter * if &filetype != "gitcommit" | call SetColours() | endif

" show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

" stolen from msysgit vimrc
"------------------------------------------------------------------------------
" only do this part when compiled with support for autocommands.
if has("autocmd")
    "Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff
      autocmd BufNewFile,BufRead *.diff set filetype=diff

      autocmd Syntax diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

      autocmd Syntax gitcommit setlocal textwidth=74
endif " has("autocmd")
