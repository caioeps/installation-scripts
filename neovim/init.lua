local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

--  _____  _             _
-- |  __ \| |           (_)
-- | |__) | |_   _  __ _ _ _ __  ___
-- |  ___/| | | | |/ _` | | '_ \/ __|
-- | |    | | |_| | (_| | | | | \__ \
-- |_|    |_|\__,_|\__, |_|_| |_|___/
--                  __/ |
--                 |___/
require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

  use {
    "neoclide/coc.nvim",
    branch = "release",
    run = "npm install --frozen-lockfile"
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'tamton-aquib/staline.nvim'

  use 'tpope/vim-surround'

  use 'mkitt/tabline.vim'

  use 'vim-test/vim-test'

  use 'tomtom/tcomment_vim'

  use 'dracula/vim'

  use 'editorconfig/editorconfig-vim'

  use 'lukas-reineke/indent-blankline.nvim'

  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}

  -- Elixir
  use 'elixir-lang/vim-elixir'
  -- Still need to manually download ElixirLS onto ~/.vim/plugged/coc-elixir/els-release.
  use {'elixir-lsp/coc-elixir', run = 'yarn install && yarn prepack'}

  -- Git
  use 'tpope/vim-fugitive'
  -- :GBrowse for GitHub
  use 'tpope/vim-rhubarb'
  -- :GBrowse for Gitlab
  use 'shumphrey/fugitive-gitlab.vim'
  -- :GBrowse for BitBucket
  use 'tommcdo/vim-fubitive'
  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}

  -- HTML
  use 'mattn/emmet-vim'
  use 'alvan/vim-closetag'

  -- JavaScript
  use {'neoclide/coc-tsserver', run = 'yarn install --frozen-lockfile'}
  use 'pangloss/vim-javascript'
  use '/peitalin/vim-jsx-typescript'
  use 'heavenshell/vim-jsdoc'
  use 'maxmellon/vim-jsx-pretty'
  use 'HerringtonDarkholme/yats.vim'
  use 'posva/vim-vue'

  -- Markdown syntax
  use 'plasticboy/vim-markdown'

  -- Ruby
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-rails'
  use 'joker1007/vim-ruby-heredoc-syntax'
  use 'rlue/vim-fold-rspec'

  -- Jump between test definition and source file
  use 'tpope/vim-projectionist'

  use 'github/copilot.vim'

  -- Handle tag generation
  use 'ludovicchabant/vim-gutentags'

  -- Visuals
  use 'yuki-yano/coc-nav'

  -- Text editor
  use 'Raimondi/delimitMate'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('lualine').setup()

-- empty setup using defaults
-- require("nvim-tree").setup()
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('telescope').setup()
-- require('telescope').load_extension('fzf')

require('staline').setup()
require('stabline').setup()


-- END OF Plugins


-- Disabling netrw messes up :GBrowse
-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd [[
  set cursorline
]]

-- COC
--   _____ ____   _____
--  / ____/ __ \ / ____|
-- | |   | |  | | |
-- | |   | |  | | |
-- | |___| |__| | |____
--  \_____\____/ \_____|
-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply code actions affect whole buffer.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Remap keys for applying codeActions to the current buffer
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

--   _____ ____   _____                  _
--  / ____/ __ \ / ____|                | |
-- | |   | |  | | |        ___ _ __   __| |
-- | |   | |  | | |       / _ \ '_ \ / _` |
-- | |___| |__| | |____  |  __/ | | | (_| |
--  \_____\____/ \_____|  \___|_| |_|\__,_|

--  _  __                                        _
-- | |/ /                                       (_)
-- | ' / ___ _   _   _ __ ___   __ _ _ __  _ __  _ _ __   __ _ ___
-- |  < / _ \ | | | | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
-- | . \  __/ |_| | | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
-- |_|\_\___|\__, | |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
--            __/ |                 | |   | |             __/ |
--           |___/                  |_|   |_|            |___/
vim.cmd [[
  nnoremap <Leader>hh :NvimTreeToggle<CR>
  nnoremap <Leader>hf :NvimTreeFindFile<CR>

  let tp=$TERM_PROGRAM
  if tp == 'Apple_Terminal'
    :" map Mac OS X Terminal.app

    " map Home/End:
    :map <ESC>[H <Home>
    :map <ESC>[F <End>
    " small 'o' letter in <C-o> means no exit from the insert mode
    :imap <ESC>[H <C-o><Home>
    :imap <ESC>[F <C-o><End>
    :cmap <ESC>[H <Home>
    :cmap <ESC>[F <End>

    " map Option+Left/Option+Right:
    " for this to work you must have the bindings in Settings > Keyboard set
    " as follows:
    " 'option cursor left' to '\033b'
    " 'option cursor right' to '\033f'
    :map <ESC>f el
    :imap <ESC>b <C-o>b
    :imap <ESC>f <C-o>el
    :cmap <ESC>f el
  endif
]]

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fr', telescope.resume, {})

vim.keymap.set('n', '<leader>gs', ':vertical leftabove Git<CR>:vertical resize 90<CR>')

vim.cmd [[
  :nmap , <leader>

  let test#strategy = "neovim"
  let test#neovim#term_position = "vert botright 80"

  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>

  " Disable arrow keys
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
]]

-- end of key mappings


-- OLD init.vim
--
vim.cmd [[
  "  _____  ______          _____  __  __ ______
  " |  __ \|  ____|   /\   |  __ \|  \/  |  ____|
  " | |__) | |__     /  \  | |  | | \  / | |__
  " |  _  /|  __|   / /\ \ | |  | | |\/| |  __|
  " | | \ \| |____ / ____ \| |__| | |  | | |____
  " |_|  \_\______/_/    \_\_____/|_|  |_|______|

  " 1. git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  " 2. brew install fzf
  " 3. brew install ripgrep

  "  ______                _   _
  " |  ____|              | | (_)
  " | |__ _   _ _ __   ___| |_ _  ___  _ __  ___
  " |  __| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
  " | |  | |_| | | | | (__| |_| | (_) | | | \__ \
  " |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
  "
  "

  function! StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
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

  " set cursorcolumn
  " set cursorline

  set iskeyword+=\-
  set iskeyword+=\?
  set iskeyword+=\!

  set synmaxcol=200

  syntax enable

  filetype on
  " Enable filetype-specific indenting
  filetype indent on

  " Enable filetype-specific plugins
  filetype plugin on
  filetype indent plugin on

  "  _  __                                        _
  " | |/ /                                       (_)
  " | ' / ___ _   _   _ __ ___   __ _ _ __  _ __  _ _ __   __ _ ___
  " |  < / _ \ | | | | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
  " | . \  __/ |_| | | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
  " |_|\_\___|\__, | |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
  "            __/ |                 | |   | |             __/ |
  "           |___/                  |_|   |_|            |___/

  " Normal mode in terminal
  :tnoremap <Esc> <C-\><C-n>

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

  " Use C-j and C-k to navigate suggestions
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

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

  " Theme
  "  _______ _
  " |__   __| |
  "    | |  | |__   ___ _ __ ___   ___
  "    | |  | '_ \ / _ \ '_ ` _ \ / _ \
  "    | |  | | | |  __/ | | | | |  __/
  "    |_|  |_| |_|\___|_| |_| |_|\___|
  "
  silent! colorscheme dracula

  """""""""""""""""""""""""
  " Plugins configuration "
  """""""""""""""""""""""""

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

  " Markdown
  let g:vim_markdown_folding_disabled = 1

  " Vim close-tag
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.jsx'
  let g:closetag_emptyTags_caseSensitive = 1
]]

