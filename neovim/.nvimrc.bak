set rtp+=~/.vim/bundle/Vundle.vim                                              " set the runtime path to include Vundle and initialize

call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  " Autocomplete
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Commenter
  Plugin 'scrooloose/nerdcommenter'

  " Delimitador
  Plugin 'Raimondi/delimitMate'

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

  " Adds snippets for many languages
  Plugin 'scrooloose/snipmate-snippets'

  " Surrounding quotes, brackets etc
  Plugin 'tpope/vim-surround'

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

  Plugin 'pangloss/vim-javascript'                                             " JavaScript Syntax
  Plugin 'heavenshell/vim-jsdoc'                                               " JSdoc
  Plugin 'maxmellon/vim-jsx-pretty'                                            " JSX syntax for React
  Plugin 'epilande/vim-react-snippets'                                         " React snippets
  Plugin 'joaohkfaria/vim-jest-snippets'                                       " Jest snippets

  " Typescript
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'mhartington/nvim-typescript', { 'do': './install.sh' }

  " Markdown syntax
  Plugin 'plasticboy/vim-markdown'

  " R syntax
  Plugin 'vim-scripts/Vim-R-plugin'

  " Ruby
  Plugin 'vim-ruby/vim-ruby'

  " HEREDOC Syntax
  Plugin 'joker1007/vim-ruby-heredoc-syntax'

  " Some tweaks for rails projects.
  Plugin 'tpope/vim-rails'

  " SCSS syntax
  Plugin 'cakebaker/scss-syntax.vim'

  " Slim Template syntax
  Plugin 'slim-template/vim-slim.git'

  " Git
  Plugin 'tpope/vim-fugitive'
  " Open files in Github
  Plugin 'tpope/vim-rhubarb'

  " Gruvbox theme
  Plugin 'morhetz/gruvbox'

  " Powerline fonts
  Plugin 'powerline/fonts'

  " Linter
  Plugin 'w0rp/ale'

  " The Silver Searcher
  Plugin 'rking/ag.vim'

  " Fold RSpec examples.
  Plugin 'rlue/vim-fold-rspec'

  " Ternjs for javascript
  Plugin 'neoclide/tern-neovim', {'do': 'npm install && npm install -g tern'}

  " Handle tag generation
  Plugin 'ludovicchabant/vim-gutentags'

  " Pug
  Plugin 'digitaltoad/vim-pug'

  " Line at bottom
  Plugin 'itchyny/lightline.vim'
call vundle#end()

" ================= Functions

function! s:StripTrailingWhitespaces()
  let l:l = line(".")
  let l:c = col(".")
  %s/\s\+$//e
  call cursor(l:l, l:c)
endfunction

" Show full path of filename
function! FilenameForLightline()
  return expand('%')
endfunction


" ================= General

set title
set encoding=utf8                                                              " Set utf-8 encoding
set fileencoding=utf-8                                                         " Set utf-8 encoding on write
set nocompatible                                                               " Not compatible with Vi. Better results
set history=500                                                                " Store lots of :cmdline history
set termguicolors
set showmode                                                                   " Show which mode we are in. (NORMAL VISUAL INSERT PASTE etc)
set mouse=a                                                                    " Enables mouse
set ruler                                                                      " Show the cursor position all time
set relativenumber                                                             " Set relative line numbers
set expandtab                                                                  " Tab to spaces
set tabstop=2                                                                  " Defaut indentation
set softtabstop=2                                                              " This should always equals `tabstop` for proper indenting
set shiftwidth=2                                                               " Controls how manu spaces >> and << use
set autoindent
set nowrap
set colorcolumn=90                                                             " Highlight max line length
set splitright                                                                 " Set up new splits positions
set splitbelow                                                                 " Set up new splits positions
set laststatus=2
"set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Fold
set nofoldenable
set foldmethod=syntax

" Scrolling
set sidescroll=3
set sidescrolloff=3
set scrolloff=2                                                                "Start scrolling when we're 2 lines away from margins

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

" Theme
silent! colorscheme gruvbox
set background=dark                                                           " Theme background color

" ================= Plugin Specific configuration

" ALE - Linter
let g:ale_linters = {'javascript': ['eslint']}                                 "Lint js with eslint
let g:ale_fixers = {'javascript': ['eslint']}                                 "Lint js with eslint
let g:ale_lint_on_save = 1                                                     "Lint when saving a file
let g:ale_sign_error = '✘'                                                     "Lint error sign
let g:ale_sign_warning = '⚠️'                                                   "Lint warning sign
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Deoplete
set previewheight=5
set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeMapActivateNode='<space>'
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" ContrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](_build|deps|dist|DS_Store|node_modules|tmp|target)|(\.(beam|git|ico|snap|svn|swp))$'
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1

" Delimit
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Deoplete
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1                                           "Enable deoplete smartcase autocompletion
let g:deoplete#max_list = 20                                                   "Max autocompletion list
call deoplete#custom#option('auth_refresh_delay', 0)

" Emmet
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
\     'javascript' : {
\       'extends' : 'jsx',
\     },
\   }

" Lightline
let g:lightline = {
\     'colorscheme': 'wombat',
\   }

let g:lightline = {
\     'active': {
\       'left': [ [ 'mode', 'paste' ],
\                 [ 'readonly', 'filename' ] ],
\     },
\     'component_function': {
\       'filename': 'FilenameForLightline',
\     },
\   }


" Markdown
let g:vim_markdown_folding_disabled = 1

" snippets
imap <C-/> <Plug>snipMateNextOrTrigger
smap <C-/> <Plug>snipMateNextOrTrigger

" ================= Key mappings

" F2 toggle PASTE mode.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

:nmap , <leader>

" Go to pane below
nnoremap <C-J> <C-W><C-J>
" Go to pane above
nnoremap <C-K> <C-W><C-K>
" Go to pane to the right
nnoremap <C-L> <C-W><C-L>
" Go to pane to the left
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Z> :tabnew %<CR>

" Bd safely closes buffer w/o closing Vim.
command Bd bp | sp | bn | bd
command QQ Bd
command QQQ bufdo Bd
command QQQQ bufdo q

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
cnoreabbrev E e

" Git
nnoremap gst :Gstatus<CR>
nnoremap gdiff :Gdiff<CR>
nnoremap gb :Gblame<CR>
vnoremap gb :Gblame<CR>

" Save and quit
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>wq :wq<CR>

" Copy to system clipboard
vnoremap <Leader>c "+y

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Toggle between last 2 buffers
nnoremap <leader>l <c-^>

" Also save with Ctrl+s
map <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>

" Also save wit Leader + s
map <Leader>s :w<CR>
imap <Leader>s <C-o>:w<CR>

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
autocmd BufRead,BufNewFile *.jsx      setlocal filetype=javascript

" Slim
autocmd BufRead,BufNewFile *.slim set filetype=slim

" Ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" ================= Autocommands

" Auto-remove trailing spaces
autocmd BufWritePre * :call s:StripTrailingWhitespaces()
" Toggle highlight off when entering insert mode
autocmd InsertEnter * :setlocal nohlsearch
" Toggle highlight back on when leaving insert mode
autocmd InsertLeave * :setlocal hlsearch
" Disable annoying sound
set noerrorbells visualbell t_vb=

if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

