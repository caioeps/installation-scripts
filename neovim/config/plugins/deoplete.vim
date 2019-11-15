set previewheight=5
set wildmode=list:full
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1                                           "Enable deoplete smartcase autocompletion
let g:deoplete#max_list = 20                                                   "Max autocompletion list
call deoplete#custom#option('auth_refresh_delay', 0)
