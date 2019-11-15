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
