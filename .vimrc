set nocompatible              " be iMproved, required
filetype on                   " required
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Enables mouse
set mouse=a

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Ruby
Plugin 'vim-ruby/vim-ruby'
" Rails
Plugin 'tpope/vim-rails'
" Automatically insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'
" Commenter
Plugin 'scrooloose/nerdcommenter'
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
" Git
Plugin 'tpope/vim-fugitive'
" Delimitador
Plugin 'Raimondi/delimitMate'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Solarized Theme
Plugin 'altercation/vim-colors-solarized'
" Molokai
Plugin 'tomasr/molokai'
" SCSS syntax
Plugin 'cakebaker/scss-syntax.vim'
" Better fonts
Plugin 'powerline/fonts'
" JavaScript Syntax
"Plugin 'pangloss/vim-javascript'
" TypeScript
Plugin 'leafgarland/typescript-vim'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
" Indent lines
Plugin 'Yggdroot/indentLine'
" Emmet html
Plugin 'mattn/emmet-vim'
" Seti Theme
Plugin 'trusktr/seti.vim'
" Mutiple selection
Plugin 'terryma/vim-multiple-cursors'
" EasyGrep -> used for finding words in a project
Plugin 'dkprice/vim-easygrep'
call vundle#end()

set ruler " show the cursor position all time

" --------------------------------------------
" APPEARANCE
" --------------------------------------------
"set number " line numbers
set relativenumber
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
set background=dark
let g:solarized_termcolors=16
let g:molokai_original = 1
let g:indentLine_color_term = 239
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
colorscheme seti
set laststatus=2 " for airline to work
let g:NERDTreeWinPos = "right" " NERDTree on right side

" Set syntax modes
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript " set typescript

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

" NERDTree mappings
map <C-\> :NERDTreeToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" CtrlP mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Default mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-e>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Delimit setting
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" -------------------------------------
"  Text settings
" -------------------------------------
" Use spaces, damn it!
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nowrap
set colorcolumn=80

" Disable annoying sound
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Emmet config
let g:user_emmet_leader_key='<tab>'
