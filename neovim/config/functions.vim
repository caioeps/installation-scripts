function! StripTrailingWhitespaces()
  let l:l = line(".")
  let l:c = col(".")
  %s/\s\+$//e
  call cursor(l:l, l:c)
endfunction

" Show full path of filename
function! FilenameForLightline()
  return expand('%')
endfunction
