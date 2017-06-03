set nocompatible              " be iMproved, required
" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" Show which mode we are in. (NORMAL VISUAL INSERT PASTE etc)
set showmode

" Enables mouse
set mouse=a

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Features
  " Autocomplete
  Plugin 'ervandew/supertab'
  " Commenter
  Plugin 'scrooloose/nerdcommenter'
  " Delimitador
  Plugin 'Raimondi/delimitMate'
  " EasyGrep
  " Used for finding words in a project
  Plugin 'dkprice/vim-easygrep'
  " Easymotion
  " Easy navigation through the file
  Plugin 'easymotion/vim-easymotion'
  " Indent lines
  Plugin 'Yggdroot/indentLine'
  " CtrlP
  " Finds file by using ctrl+p
  Plugin 'ctrlpvim/ctrlp.vim'
  " Matchit
  " Match opening and closing tags
  Plugin 'geoffharcourt/vim-matchit'
  " Mutiple selection
  Plugin 'terryma/vim-multiple-cursors'
  " NERDTree
  " Treeview of the project
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  " Snipmate
  " Provides snippets
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
    " Adds snippets for many languages
    Plugin 'scrooloose/snipmate-snippets'
  " Rename
  " Rename files with :rename[!] {filename}
  Plugin 'danro/rename.vim'

" Language plugins
" Elixir
  " Elixir syntax
  Plugin 'elixir-lang/vim-elixir'
  " Information about elixir project
  Plugin 'slashmili/alchemist.vim'
" Html
  " Automatically insert the closing HTML tag
  Plugin 'HTML-AutoCloseTag'
  " Emmet html
  Plugin 'mattn/emmet-vim'
" Javascript
  " JavaScript Syntax
  Plugin 'pangloss/vim-javascript'
  " CoffeeScript syntax
  Plugin 'kchmck/vim-coffee-script'
  " TypeScript syntax
  Plugin 'leafgarland/typescript-vim'
" Markdown
  " Markdown syntax
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
" R
  " R syntax
  Plugin 'vim-scripts/Vim-R-plugin'
" Ruby
  " Ruby syntax
  Plugin 'vim-ruby/vim-ruby'
  " Some tweaks for rails projects
  Plugin 'tpope/vim-rails'
" SASS
  " SCSS syntax
  Plugin 'cakebaker/scss-syntax.vim'
" Slim Template
  " Slim Template syntax
  Plugin 'slim-template/vim-slim.git'

" Themes
  " Airline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  " Molokai
  Plugin 'tomasr/molokai'
  " Powerline fonts
  " Better fonts
  Plugin 'powerline/fonts'
  " Seti Theme
  Plugin 'trusktr/seti.vim'
  " Solarized Theme
  Plugin 'altercation/vim-colors-solarized'


" Unused
" Git
  " Some commands to help with git.
  "Plugin 'tpope/vim-fugitive'
call vundle#end()

" required
filetype on
syntax enable
" Enable filetype-specific indenting
filetype indent on
" Enable filetype-specific plugins
filetype plugin on
filetype indent plugin on

" Show the cursor position all time
set ruler
" Set relative line numbers
set relativenumber

" +----+
" |FONT|
" +----+
" Set font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ Regular\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Tells Airline theme to use powerline style
let g:airline_powerline_fonts = 1

" +----+
" |Tabs|
" +----+
" Using tabs:
" "\1" changes to tab #1
" "\2" changes to tab #1
" etc...
" "\-" changes to previous tab
" "\+" changes to previous tab
" ":Bd" closes current tab
" Enable tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Tab / buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" +-----+
" |THEME|
" +-----+
set background=dark
let g:solarized_termcolors=16
let g:molokai_original = 1
let g:indentLine_color_term = 239
"
" If using gnome terminal, we'll be able to use 256 colors
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Tell VIM what colorscheme to use
colorscheme seti
" for airline to work
set laststatus=2

" NERDTree
" Using NERDTree
" "Ctrl+\" toggles treeview.
" Select a folder and press "r" and it will be reloaded.
" Tell NERDTree which side the treeview should be placed
let g:NERDTreeWinPos = "left"
" NERDTree mappings
map <C-\> :NERDTreeToggle<CR>

" RSpec.vim mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" ContrlP
" Using CtrlP
" "ctrl+p" will open a search box.
" CtrlP mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" MultipleCursors
" Using Multiple Cursors
" Press "ctrl+d" to select whole word, then press it again to select the
" next.
" Press "ctrl+e" to select previous word.
" Press "ctrl+x" to skip selection.
" Default mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-e>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Delimit
" Delimit settings
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" +--------------+
" | Text settings|
" +--------------+
" Use spaces.
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nowrap
" Highlight max line length
set colorcolumn=90

" Markdown no folding.
let g:vim_markdown_folding_disabled = 1

" Disable annoying sound
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Emmet config
let g:user_emmet_leader_key='<tab>'

" snippets
imap <C-/> <Plug>snipMateNextOrTrigger
smap <C-/> <Plug>snipMateNextOrTrigger

" Pasting content.
" Some times you'll notice that pasting into your file you'll get unindented
" content. To paste properly, you should press "F2" to enter in PASTE mode.
" Just press it again to exit PASTE mode.
" paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" +-----+
" |PANES|
" +-----+
" Using panes
" Splitting horizontally:
"   :split
"   <ctrl+w> <s>
" Splitting vertically:
"   :vsplit
"   <ctrl+w> <v>
" Moving through panes:
"   Ctrl+J move one pane down
"   Ctrl+K move one pane up
"   Ctrl+L move one pane right
"   Ctrl+K move one pane left
" Natural splits move
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Don't know wtf this is for
command Bd bp | sp | bn | bd

" +----------+
" | FILETYPES|
" +----------+
" associate *.css.erb with css filetype
au BufRead,BufNewFile *.css.erb setfiletype css
" associate *.coffee with coffee filetype
au BufRead,BufNewFile *.coffee setfiletype coffee
" associate *.ex with elixir filetype
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
" associate *.js.erb with js filetype
au BufRead,BufNewFile *.js.erb setfiletype js
" associate *.slim with slim filetype
au BufRead,BufNewFile *.slim set filetype=slim

" TypeScript syntax for .ts and .tsc files
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

" Identation for filetypes
" 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffee setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

