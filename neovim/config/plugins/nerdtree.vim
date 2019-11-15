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
