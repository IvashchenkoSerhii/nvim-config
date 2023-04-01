call plug#begin('~/.vim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

" End of LSP Support

Plug 'github/copilot.vim'

" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'folke/trouble.nvim'

" better quickfix
Plug 'kevinhwang91/nvim-bqf'

Plug 'folke/which-key.nvim'

" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" FZF
" install additional:
" for syntax highlight preview: https://github.com/sharkdp/bat
" for Rg: https://github.com/BurntSushi/ripgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" color scheme

Plug 'morhetz/gruvbox' " classic
" Plug 'ellisonleao/gruvbox.nvim'  " lua clone
Plug 'rafi/awesome-vim-colorschemes'
" --

" footer bar
Plug 'vim-airline/vim-airline'


" type: `gcc` for comment line
" Plug 'tpope/vim-commentary'
" type: `gc` for comment line
Plug 'numToStr/Comment.nvim'

Plug 'ThePrimeagen/harpoon'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'phaazon/hop.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

Plug 'wakatime/vim-wakatime'

" telescope
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
" --

call plug#end()
