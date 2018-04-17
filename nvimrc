set rtp+=~/.vim/bundle/Vundle.vim                                              " set the runtime path to include Vundle and initialize

call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  " Autocomplete
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Commenter
  Plugin 'scrooloose/nerdcommenter'
  " Delimitador
  Plugin 'Raimondi/delimitMate'
  " EasyGrep
  " Used for finding words in a project
  Plugin 'dkprice/vim-easygrep'
  " Easy navigation through the file
  Plugin 'easymotion/vim-easymotion'
  " Indent lines
  Plugin 'Yggdroot/indentLine'
  " CtrlP - find files
  Plugin 'ctrlpvim/ctrlp.vim'
  " Matchit - opening and closing tags
  Plugin 'geoffharcourt/vim-matchit'
  " NERDTree
  " Treeview of the project
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  " Provides snippets
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  " Adds snippets for many languages
  Plugin 'scrooloose/snipmate-snippets'
  " Rename
  Plugin 'danro/rename.vim'
  " Crystal Syntax
  Plugin 'rhysd/vim-crystal'
  " Elixir syntax
  Plugin 'elixir-lang/vim-elixir'
  " Information about elixir project
  Plugin 'slashmili/alchemist.vim'
  " Automatically insert the closing HTML tag
  Plugin 'HTML-AutoCloseTag'
  " Emmet html
  Plugin 'mattn/emmet-vim'
  " CoffeeScript syntax
  Plugin 'kchmck/vim-coffee-script'
  " Ionic syntax highlight
  Plugin 'akz92/vim-ionic2'
  " JavaScript Syntax
  Plugin 'pangloss/vim-javascript'
  " JSX syntax for React
  Plugin 'maxmellon/vim-jsx-pretty'
  " TypeScript syntax
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'mhartington/nvim-typescript'
  " Latex
  Plugin 'lervag/vimtex'
  " Markdown syntax
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
  " R syntax
  Plugin 'vim-scripts/Vim-R-plugin'
  " Ruby syntax
  Plugin 'vim-ruby/vim-ruby'
  " Some tweaks for rails projects
  Plugin 'tpope/vim-rails'
  " SCSS syntax
  Plugin 'cakebaker/scss-syntax.vim'
  " Slim Template syntax
  Plugin 'slim-template/vim-slim.git'
  " Git
  Plugin 'tpope/vim-fugitive'
  " Airline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  " Gruvbox
  Plugin 'morhetz/gruvbox'
  " Powerline fonts
  Plugin 'powerline/fonts'
call vundle#end()

" ================= Functions

function! s:StripTrailingWhitespaces()
  let l:l = line(".")
  let l:c = col(".")
  %s/\s\+$//e
  call cursor(l:l, l:c)
endfunction

" ================= General

set encoding=utf8                                                              " Set utf-8 encoding
set fileencoding=utf-8                                                         " Set utf-8 encoding on write
set nocompatible                                                               " Not compatible with Vi. Better results
set history=500                                                                " Store lots of :cmdline history
set termguicolors
set showmode                                                                   " Show which mode we are in. (NORMAL VISUAL INSERT PASTE etc)
set mouse=a                                                                    " Enables mouse
set clipboard=unnamed                                                          " Set clipboard to the default
set ruler                                                                      " Show the cursor position all time
set relativenumber                                                             " Set relative line numbers
set background=dark                                                            " Theme background color
set expandtab                                                                  " Tab to spaces
set tabstop=2                                                                  " Defaut indentation
set softtabstop=2                                                              " This should always equals `tabstop` for proper indenting
set shiftwidth=2                                                               " Controls how manu spaces >> and << use
set autoindent
set nowrap
set colorcolumn=80                                                             " Highlight max line length
set splitright                                                                 " Set up new splits positions
set nofoldenable                                                               " Disable folding

" Scrolling
set sidescroll=5
set scrolloff=8                                                                "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15

" No backups nor swap files
set noswapfile
set nobackup
set nowb

syntax enable

filetype on

filetype indent on                                                             " Enable filetype-specific indenting
" Enable filetype-specific plugins
filetype plugin on
filetype indent plugin on

silent! colorscheme gruvbox

" ================= Plugin Specific configuration

" Airline
set laststatus=2                                                               " Always displays current file, so Airline works
let g:airline_powerline_fonts = 1                                              " Tells Airline theme to use powerline style
let g:airline#extensions#tabline#enabled = 1                                   " Enable tabline ext
let g:airline#extensions#tabline#left_sep = ' '                                " Tabline left separator
let g:airline#extensions#tabline#left_alt_sep = '|'                            " Tabline right separator
let g:airline#extensions#tabline#buffer_idx_mode = 1                           " TODO Don't know
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

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeMapActivateNode='<space>'
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']
autocmd StdinReadPre * let s:std_in=1                                          " Open NERDTree when vim is opened without any specified file
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif    " Open NERDTree when vim is opened without any specified file
" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" ContrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](_build|deps|dist|DS_Store|git|logs|node_modules|tmp|target|vendor)|(\.(beam|git|ico|svn|swp))$'
let g:ctrlp_max_files = 0

" Delimit
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1                                           "Enable deoplete smartcase autocompletion
let g:deoplete#max_list = 1000                                                 "Max autocompletion list

" Emmet
let g:user_emmet_leader_key='<C-y>'

" Markdown
let g:vim_markdown_folding_disabled = 1

" snippets
imap <C-/> <Plug>snipMateNextOrTrigger
smap <C-/> <Plug>snipMateNextOrTrigger

" ================= Key mappings

" F2 toggle PASTE mode.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Go to pane below
nnoremap <C-J> <C-W><C-J>
" Go to pane above
nnoremap <C-K> <C-W><C-K>
" Go to pane to the right
nnoremap <C-L> <C-W><C-L>
" Go to pane to the left
nnoremap <C-H> <C-W><C-H>

command Bd bp | sp | bn | bd                                                   " Bd safely closes buffer w/o closing Vim.

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Use C-j and C-k to navigate deoplete suggestions
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev bD bd

" Git
nnoremap gst :Gstatus<CR>
nnoremap gdiff :Gdiff<CR>
nnoremap gb :Gblame<CR>
vnoremap gb :Gblame<CR>

" Save and quit
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>wq :wq<CR>

" Better movement
nnoremap H 0
nnoremap L $

" Copy to system clipboard
vnoremap <Leader>c "+y

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Toggle between last 2 buffers
nnoremap <leader>l <c-^>

" ================= Filetype specific configs

" CSS
autocmd BufRead,BufNewFile *.css.erb setfiletype css

" Elixir
autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
autocmd BufRead,BufNewFile *.eex set filetype=eelixir

" Html
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" Javascript
autocmd Filetype javascript           setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript           setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffee               setlocal ts=4 sw=4 sts=0 expandtab
autocmd BufRead,BufNewFile *.coffee   setlocal filetype=coffee
autocmd BufRead,BufNewFile *.js.erb   setlocal filetype=javascript
autocmd BufRead,BufNewFile *.ts,*.tsx setlocal filetype=typescript
autocmd BufRead,BufNewFile *.json     setlocal filetype=javascript
autocmd BufRead,BufNewFile *.jsx      setlocal filetype=typescript

" Slim
autocmd BufRead,BufNewFile *.slim set filetype=slim

" Ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" ================= Autocommands
autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                 " Auto-remove trailing spaces
autocmd InsertEnter * :setlocal nohlsearch                                     " Toggle highlight off when entering insert mode
autocmd InsertLeave * :setlocal hlsearch                                       " Toggle highlight back on when leaving insert mode
set noerrorbells visualbell t_vb=                                              " Disable annoying sound
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

