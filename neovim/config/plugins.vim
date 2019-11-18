" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  " Autocomplete
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Commenter
  Plugin 'scrooloose/nerdcommenter'

  " Delimitador
  Plugin 'Raimondi/delimitMate'

  " Indent lines
  Plugin 'Yggdroot/indentLine'

  " CtrlP - find files
  Plugin 'ctrlpvim/ctrlp.vim'

  " Matchit - opening and closing tags
  Plugin 'geoffharcourt/vim-matchit'

  " NERDTree
  " Treeview of the project
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'

  " Surrounding quotes, brackets etc
  Plugin 'tpope/vim-surround'

  " Crystal Syntax
  Plugin 'rhysd/vim-crystal'

  " Elixir syntax
  Plugin 'elixir-lang/vim-elixir'

  " Information about elixir project
  Plugin 'slashmili/alchemist.vim'

  " Automatically insert the closing HTML tag
  Plugin 'HTML-AutoCloseTag'

  " Emmet html
  Plugin 'mattn/emmet-vim'

  " CoffeeScript syntax
  Plugin 'kchmck/vim-coffee-script'

  Plugin 'pangloss/vim-javascript'                                             " JavaScript Syntax
  Plugin 'heavenshell/vim-jsdoc'                                               " JSdoc
  Plugin 'maxmellon/vim-jsx-pretty'                                            " JSX syntax for React
  Plugin 'epilande/vim-react-snippets'                                         " React snippets
  Plugin 'joaohkfaria/vim-jest-snippets'                                       " Jest snippets

  " Typescript
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'mhartington/nvim-typescript', { 'do': './install.sh' }

  " Markdown syntax
  Plugin 'plasticboy/vim-markdown'

  " Ruby
  Plugin 'vim-ruby/vim-ruby'

  " HEREDOC Syntax
  Plugin 'joker1007/vim-ruby-heredoc-syntax'

  " Some tweaks for rails projects.
  Plugin 'tpope/vim-rails'

  " SCSS syntax
  Plugin 'cakebaker/scss-syntax.vim'

  " Slim Template syntax
  Plugin 'slim-template/vim-slim.git'

  " Git
  Plugin 'tpope/vim-fugitive'

  " Gruvbox theme
  Plugin 'morhetz/gruvbox'

  " Powerline fonts
  Plugin 'powerline/fonts'

  " Linter
  Plugin 'w0rp/ale'

  " The Silver Searcher
  Plugin 'rking/ag.vim'

  " Fold RSpec examples.
  Plugin 'rlue/vim-fold-rspec'

  " Ternjs for javascript
  Plugin 'neoclide/tern-neovim', {'do': 'npm install && npm install -g tern'}

  " Handle tag generation
  Plugin 'ludovicchabant/vim-gutentags'

  " Pug
  Plugin 'digitaltoad/vim-pug'

  " Line at bottom
  Plugin 'itchyny/lightline.vim'

  " Tree icons
  Plugin 'ryanoasis/vim-devicons'
call vundle#end()
