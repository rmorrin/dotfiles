set backspace=indent,eol,start                  " make that backspace key work the way it should
filetype indent on                              " activates indenting for files
set autoindent                                  " auto indenting
set nowrap                                      " don't wrap lines
set number                                      " line numbers
set nobackup                                    " get rid of anoying ~file
set laststatus=2                                " make the last line where the status is two lines deep so you can see status always
"set paste
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
syntax on                                       " turn syntax highlighting on by default
set noshowmode                                  " disable showmode, vim-airline will show us this
set term=xterm                                  "
set t_Co=256                                    "
set viminfo=                                    "
set encoding=utf-8
let &t_AB="\e[48;5;%dm"                         "
let &t_AF="\e[38;5;%dm"                         "
let g:hybrid_use_XResources = 1                 "
colorscheme hybrid                              "
let g:airline_theme = 'tomorrow'                "
let g:airline_powerline_fonts = 1               "

" pathogen
execute pathogen#infect()

" NERDTree mapping
:map <F2> :NERDTreeToggle<CR>

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
