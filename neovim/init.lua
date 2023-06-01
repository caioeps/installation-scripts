--     ____  _________    ____  __  _________
--    / __ \/ ____/   |  / __ \/  |/  / ____/
--   / /_/ / __/ / /| | / / / / /|_/ / __/
--  / _, _/ /___/ ___ |/ /_/ / /  / / /___
-- /_/ |_/_____/_/  |_/_____/_/  /_/_____/
--
-- # Prerequesites:
--
-- 1. npm i -g vscode-langservers-extracted typescript typescript-language-server
-- 2. gem install --user-install solargraph
-- 3. Setup ElixirLS
--   a. Download a release from https://github.com/elixir-lsp/elixir-ls/releases
--   a. unzip ~/Downloads/RELEASE_FILE.zip -d ~/.elixir-ls

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

-- ASCII generator
-- https://patorjk.com/software/taag/#p=display&f=Big&t=Type%20Something%20
-- https://patorjk.com/software/taag/#p=display&f=Slant&t=Lualine

require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end
  }

--     __   _____ ____              __                                                _____                              ____             __                   __
--    / /  / ___// __ \            / /   ____ _____  ____ ___  ______ _____ ____     / ___/___  ______   _____  _____   / __ \_________  / /_____  _________  / /
--   / /   \__ \/ /_/ /  ______   / /   / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \    \__ \/ _ \/ ___/ | / / _ \/ ___/  / /_/ / ___/ __ \/ __/ __ \/ ___/ __ \/ /
--  / /______/ / ____/  /_____/  / /___/ /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __/   ___/ /  __/ /   | |/ /  __/ /     / ____/ /  / /_/ / /_/ /_/ / /__/ /_/ / /
-- /_____/____/_/               /_____/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/   /____/\___/_/    |___/\___/_/     /_/   /_/   \____/\__/\____/\___/\____/_/
--                                                /____/            /____/
use {
  'neovim/nvim-lspconfig',
  requires = {
    -- {'williamboman/mason.nvim', run = ':MasonUpdate'},
    -- {'williamboman/mason-lspconfig.nvim'},
    {'jose-elias-alvarez/null-ls.nvim'}, -- Formatters and linters. e.g.: Prettier, Rubocop
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'nvim-lua/plenary.nvim'}, -- dependency for null-ls
    {'L3MON4D3/LuaSnip'},
  },
  config = function()
    -- require("mason").setup()

    -- Setup language servers.
    local lspconfig = require('lspconfig')

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

    local servers_with_default_config = { 'cssls', 'html', 'jsonls', 'rust_analyzer', 'solargraph', 'tsserver' }
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    for _, lsp in ipairs(servers_with_default_config) do
      lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
      }
    end

    lspconfig.elixirls.setup {
      cmd = { '/Users/caioergos/.elixir-ls/language_server.sh' },
      capabilities = capabilities
    }

    local luasnip = require 'luasnip'

    local cmp = require('cmp')
    cmp.setup {
      snippet = {
        expand = function(args)
          -- noop
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
            --   luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
            -- elseif luasnip.jumpable(-1) then
            --   luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' },
      },
    }

    require("null-ls").setup()
  end
}

--       __                ___
--    / /   __  ______ _/ (_)___  ___
--   / /   / / / / __ `/ / / __ \/ _ \
--  / /___/ /_/ / /_/ / / / / / /  __/
-- /_____/\__,_/\__,_/_/_/_/ /_/\___/

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  }

--   ______     __
--  /_  __/__  / /__  ______________  ____  ___
--   / / / _ \/ / _ \/ ___/ ___/ __ \/ __ \/ _ \
--  / / /  __/ /  __(__  ) /__/ /_/ / /_/ /  __/
-- /_/  \___/_/\___/____/\___/\____/ .___/\___/
--                                /_/
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-live-grep-args.nvim'},
      {'gbrlsnchs/telescope-lsp-handlers.nvim'},
      {'nvim-telescope/telescope-file-browser.nvim'},
    },
    config = function()
      local fb_actions = require "telescope".extensions.file_browser.actions

      require('telescope').setup({
        extensions = {
          file_browser = {
            -- path
            -- cwd
            cwd_to_path = false,
            grouped = true,
            files = true,
            add_dirs = true,
            depth = 1,
            auto_depth = false,
            select_buffer = false,
            hidden = { file_browser = false, folder_browser = false },
            -- respect_gitignore
            -- browse_files
            -- browse_folders
            hide_parent_dir = false,
            collapse_dirs = false,
            prompt_path = false,
            quiet = false,
            dir_icon = "",
            dir_icon_hl = "Default",
            display_stat = { date = true, size = true, mode = true },
            hijack_netrw = false,
            use_fd = true,
            git_status = true,
            mappings = {
              ["i"] = {
                ["<A-c>"] = fb_actions.create,
                ["<S-CR>"] = fb_actions.create_from_prompt,
                ["<A-r>"] = fb_actions.rename,
                ["<A-m>"] = fb_actions.move,
                ["<A-y>"] = fb_actions.copy,
                ["<A-d>"] = fb_actions.remove,
                ["<C-o>"] = fb_actions.open,
                ["<C-g>"] = fb_actions.goto_parent_dir,
                ["<C-e>"] = fb_actions.goto_home_dir,
                ["<C-w>"] = fb_actions.goto_cwd,
                ["<C-t>"] = fb_actions.change_cwd,
                ["<C-f>"] = fb_actions.toggle_browser,
                ["<C-h>"] = fb_actions.toggle_hidden,
                ["<C-s>"] = fb_actions.toggle_all,
                ["<bs>"] = fb_actions.backspace,
              },
              ["n"] = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["d"] = fb_actions.remove,
                ["o"] = fb_actions.open,
                ["g"] = fb_actions.goto_parent_dir,
                ["e"] = fb_actions.goto_home_dir,
                ["w"] = fb_actions.goto_cwd,
                ["t"] = fb_actions.change_cwd,
                ["f"] = fb_actions.toggle_browser,
                ["h"] = fb_actions.toggle_hidden,
                ["s"] = fb_actions.toggle_all,
              },
            },
          },
          lsp_handlers = {
            disable = {},
            location = {
              telescope = {},
              no_results_message = 'No references found',
            },
            symbol = {
              telescope = {},
              no_results_message = 'No symbols found',
            },
            call_hierarchy = {
              telescope = {},
              no_results_message = 'No calls found',
            },
            code_action = {
              telescope = require('telescope.themes').get_dropdown({}),
              no_results_message = 'No code actions available',
              prefix = '',
            },
          },
        }
      })
      require('telescope').load_extension('live_grep_args')
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('lsp_handlers')
      require('telescope').load_extension('file_browser')

      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
      vim.keymap.set("n", "<leader>fg", require('telescope').extensions.live_grep_args.live_grep_args)
      vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
      vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, {})

      vim.keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})

      vim.api.nvim_set_keymap(
        "n",
        "<leader>ft",
        ":Telescope file_browser initial_mode=normal<CR>",
        { noremap = true }
      )

      -- open file_browser with the path of the current buffer
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fT",
        ":Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>",
        { noremap = true }
      )
    end
  }

  use {'tamton-aquib/staline.nvim', config = function()
    require('staline').setup()
    require('stabline').setup()
  end}

  use 'tpope/vim-surround'

  use 'mkitt/tabline.vim'

  use {
    'vim-test/vim-test',
    config = function()
      vim.cmd [[
        let test#strategy = "neovim"
        "let test#neovim#term_position = "vert botright"
        let test#neovim#term_position = "botright"
        let test#neovim#start_normal = 1

        nmap <silent> <space>t :TestNearest<CR>
        nmap <silent> <space>T :TestFile<CR>
        nmap <silent> <space>a :TestSuite<CR>
        nmap <silent> <space>l :TestLast<CR>
        nmap <silent> <space>g :TestVisit<CR>

        nmap <silent> <leader>t :TestNearest<CR>
        nmap <silent> <leader>T :TestFile<CR>
        nmap <silent> <leader>a :TestSuite<CR>
        nmap <silent> <leader>l :TestLast<CR>
        nmap <silent> <leader>g :TestVisit<CR>
      ]]
    end
  }

  use 'tomtom/tcomment_vim'

  use 'editorconfig/editorconfig-vim'

  use 'lukas-reineke/indent-blankline.nvim'

  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}

  -- Git
  use {
    'tpope/vim-fugitive',
    requires = {
      -- :GBrowse for GitHub
      {'tpope/vim-rhubarb'},
      -- :GBrowse for Gitlab
      {'shumphrey/fugitive-gitlab.vim'},
      -- :GBrowse for BitBucket
      {'tommcdo/vim-fubitive'},
      {'akinsho/git-conflict.nvim', tag = "*"}
    },
    config = function()
      require('git-conflict').setup()
      vim.keymap.set('n', 'gs', ':vertical leftabove Git<CR>:vertical resize 90<CR>')
      vim.keymap.set({'n', 'v'}, 'gb', ':G blame<CR>')
    end
  }

  -- HTML
  use 'mattn/emmet-vim'
  use 'alvan/vim-closetag'

  -- Ruby
  use 'tpope/vim-rails'
  use 'joker1007/vim-ruby-heredoc-syntax'
  use 'rlue/vim-fold-rspec'

  -- Syntax
  use 'elixir-lang/vim-elixir'
  use 'vim-ruby/vim-ruby'
  use 'pangloss/vim-javascript'
  use 'heavenshell/vim-jsdoc'
  use '/peitalin/vim-jsx-typescript'
  use 'plasticboy/vim-markdown'
  use 'posva/vim-vue'
  use 'HerringtonDarkholme/yats.vim'
  use 'maxmellon/vim-jsx-pretty'

  -- Jump between test definition and source file
  use 'tpope/vim-projectionist'

  use 'github/copilot.vim'

  -- Handle tag generation
  use 'ludovicchabant/vim-gutentags'

  -- Text editor
  use 'Raimondi/delimitMate'

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  }


  -- Database
  use {
    "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1

      vim.api.nvim_exec(
      [[
        autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
      ]],
      false
      )
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd [[
  set cursorline
]]

--  _  __                                        _
-- | |/ /                                       (_)
-- | ' / ___ _   _   _ __ ___   __ _ _ __  _ __  _ _ __   __ _ ___
-- |  < / _ \ | | | | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
-- | . \  __/ |_| | | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
-- |_|\_\___|\__, | |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
--            __/ |                 | |   | |             __/ |
--           |___/                  |_|   |_|            |___/
vim.cmd [[
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
-- end of key mappings


-- Terminal
vim.g.terminal_scrollback_buffer_size = 100000
vim.cmd [[
  " Normal mode in terminal
  :tnoremap <Esc> <C-\><C-n>
  set scrollback=100000
]]

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

  " Disable arrow keys
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>

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

