set rtp+=~/.vim/caio

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dracula/vim'

Plug 'editorconfig/editorconfig-vim'

" Delimitador
Plug 'Raimondi/delimitMate'

Plug 'tomtom/tcomment_vim'

Plug 'scrooloose/nerdtree'

Plug 'itchyny/lightline.vim'

" Surrounding quotes, brackets etc
Plug 'tpope/vim-surround'

" Elixir syntax
Plug 'elixir-lang/vim-elixir'

" Information about Elixir project
Plug 'slashmili/alchemist.vim'

" Emmet html
Plug 'mattn/emmet-vim'

Plug 'alvan/vim-closetag'

Plug 'pangloss/vim-javascript'
Plug '/peitalin/vim-jsx-typescript'
Plug 'heavenshell/vim-jsdoc'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'

" Markdown syntax
Plug 'plasticboy/vim-markdown'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" HEREDOC Syntax
Plug 'joker1007/vim-ruby-heredoc-syntax'

" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fubitive'

" Linter
Plug 'w0rp/ale'

" The Silver Searcher
Plug 'rking/ag.vim'

" Fold RSpec examples.
Plug 'rlue/vim-fold-rspec'

" Handle tag generation
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

"""""""""""""
" Functions "
"""""""""""""

function! StripTrailingWhitespaces()
  let l:l = line(".")
  let l:c = col(".")
  %s/\s\+$//e
  call cursor(l:l, l:c)
endfunction

" Show full path of filename
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! SyntaxTurnOff()
  "Turns syntax off only in current buffer
  exec "syntax clear"
endfunction

function! SyntaxTurnOn()
  exec "syntax on"
endfunction

""""""""
" Sets "
""""""""

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
set colorcolumn=120

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

set ignorecase
set smartcase

set cursorcolumn
set cursorline

set iskeyword+=\-
set iskeyword+=\?
set iskeyword+=\!

syntax enable

filetype on
" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on
filetype indent plugin on

""""""""""""
" Mappings "
""""""""""""

" Normal mode in terminal
:tnoremap <Esc> <C-\><C-n>

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

" Bd safely closes buffer w/o closing Vim.
command QQ bp | sp | bn | bd
command QQQ bufdo QQ
command QQQQ bufdo q

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Use C-j and C-k to navigate suggestions
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev E e

" Git
nnoremap gst :Gstatus<CR>
nnoremap gdiff :Gdiff<CR>
nnoremap gb :Gblame<CR>
vnoremap gb :Gblame<CR>

" Toggle between last 2 buffers
nnoremap <leader>l <c-^>

" Also save wit Leader + s
map <Leader>s :w<CR>
imap <Leader>s <C-o>:w<CR>

map <Leader>t :tabnew<CR>
imap <Leader>t <C-o>:tabnew<CR>


"""""""""""""
" Auto CMDS "
"""""""""""""

" CSS
autocmd BufRead,BufNewFile *.css.erb setfiletype css

" Elixir
autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
autocmd BufRead,BufNewFile *.eex set filetype=eelixir

" Javascript
autocmd BufRead,BufNewFile *.coffee   setlocal filetype=coffee
autocmd BufRead,BufNewFile *.js.erb   setlocal filetype=javascript
autocmd BufRead,BufNewFile *.ts       setlocal filetype=typescript
autocmd BufRead,BufNewFile *.jsx      setlocal filetype=javascript

" Slim
autocmd BufRead,BufNewFile *.slim set filetype=slim

" Auto-remove trailing spaces
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Toggle highlight off when entering insert mode
autocmd InsertEnter * :setlocal nohlsearch

" Toggle highlight back on when leaving insert mode
autocmd InsertLeave * :setlocal hlsearch

" Disable annoying sound
set noerrorbells visualbell t_vb=

"""""""""
" Theme "
"""""""""

silent! colorscheme dracula

"""""""""""""""""""""""""
" Plugins configuration "
"""""""""""""""""""""""""

" Ale
"Lint js with eslint
let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'vue': ['eslint', 'prettier'],
      \ 'css': ['prettier'],
      \ 'json': ['jq'],
      \ 'ruby': ['rubocop', 'reek'],
      \}
"Lint js with eslint
let g:ale_fixers = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'vue': ['eslint', 'prettier'],
      \ 'css': ['prettier'],
      \ 'json': ['jq'],
      \ 'ruby': ['rubocop', 'reek'],
      \}
"Lint when saving a file
let g:ale_lint_on_save = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '>'
let g:ale_linters_explicit = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

augroup ALEFixGroup
    autocmd!
    autocmd User ALEFixPre     call SyntaxTurnOff()
    autocmd User ALEFixPost    call SyntaxTurnOn()
augroup END

" COC
  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add `:Prettier` command for formatting file
  command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

  " Add `:Eslint` command for formatting file
  command! -nargs=0 Eslint :call CocAction('runCommand', 'eslint.executeAutofix')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Delimit
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Emmet
let g:user_emmet_leader_key='<C-y>'

" FZF
map <C-p> :Files<CR>

" Lightline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

" Markdown
let g:vim_markdown_folding_disabled = 1

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeMapActivateNode='<space>'
"Disable help text and bookmark title
let g:NERDTreeMinimalUI = 1
"Show hidden files in NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Vim close-tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
