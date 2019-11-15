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
