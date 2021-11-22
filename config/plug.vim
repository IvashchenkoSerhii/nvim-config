call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'L3MON4D3/LuaSnip'
" --

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" git integration
Plug 'tpope/vim-fugitive'

" FZF
" install additional:
" for syntax highlight preview: https://github.com/sharkdp/bat
" for Rg: https://github.com/BurntSushi/ripgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" color scheme
Plug 'morhetz/gruvbox'
" --

" footer bar
Plug 'vim-airline/vim-airline'
" Plug 'flazz/vim-colorschemes'

" git symbols
Plug 'airblade/vim-gitgutter'

" type: `gcc` for comment line
Plug 'tpope/vim-commentary'

" jump game. :UpdateRemotePlugins after install. To run :VimBeGood
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

Plug 'phaazon/hop.nvim'

Plug 'tpope/vim-surround'

Plug 'wakatime/vim-wakatime'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" --

call plug#end()
