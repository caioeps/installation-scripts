" CSS
autocmd BufRead,BufNewFile *.css.erb setfiletype css

" Elixir
autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
autocmd BufRead,BufNewFile *.eex set filetype=eelixir

" Javascript
autocmd BufRead,BufNewFile *.coffee   setlocal filetype=coffee
autocmd BufRead,BufNewFile *.js.erb   setlocal filetype=javascript
autocmd BufRead,BufNewFile *.ts,*.tsx setlocal filetype=typescript
autocmd BufRead,BufNewFile *.json     setlocal filetype=javascript
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

