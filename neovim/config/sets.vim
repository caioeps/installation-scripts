set title

" Set utf-8 encoding
set encoding=utf8

" Set utf-8 encoding on write
set fileencoding=utf-8

" Not compatible with Vi. Better results
set nocompatible

" Store lots of :cmdline history
set history=500

set termguicolors

" Show which mode we are in. (NORMAL VISUAL INSERT PASTE etc)
set showmode

" Enables mouse
set mouse=a

" Show the cursor position all time
set ruler

" Set relative line numbers
set relativenumber

" Tab to spaces
set expandtab

" Defaut indentation
set tabstop=2

" This should always equals `tabstop` for proper indenting
set softtabstop=2

" Controls how manu spaces >> and << use
set shiftwidth=2

set autoindent

set nowrap

" Highlight max line length
set colorcolumn=90

" Set up new splits positions
set splitright
" Set up new splits positions
set splitbelow

set laststatus=2

" Fold
set nofoldenable
set foldmethod=syntax

" Scrolling
set sidescroll=3
set sidescrolloff=3
"Start scrolling when we're 2 lines away from margins
set scrolloff=2

" No backups nor swap files
set noswapfile
set nobackup
set nowb

syntax enable

filetype on
" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on
filetype indent plugin on
