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
set encoding=utf-8                              " UTF-8 encoding

" colors
" set term=xterm                                  "
" set t_Co=256                                    "
" let &t_AB="\e[48;5;%dm"                         "
" let &t_AF="\e[38;5;%dm"                         "
" let g:hybrid_use_XResources = 1                 "
" colorscheme hybrid                              "

" airline 
" let g:airline_theme='tomorrow'                  "
" let g:airline_powerline_fonts = 1             " populate airline with powerline symbols
" let g:airline_left_sep = ''                   " disable left airline separator
" let g:airline_right_sep = ''                  " disable right airline separator

" pathogen
" execute pathogen#infect()

" NERDTree mapping
" :map <F2> :NERDTreeToggle<CR>
