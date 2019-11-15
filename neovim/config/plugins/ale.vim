let g:ale_linters = {'javascript': ['eslint']}                                 "Lint js with eslint
let g:ale_fixers = {'javascript': ['eslint']}                                 "Lint js with eslint
let g:ale_lint_on_save = 1                                                     "Lint when saving a file
let g:ale_sign_error = '✘'                                                     "Lint error sign
let g:ale_sign_warning = '⚠️'                                                   "Lint warning sign
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
