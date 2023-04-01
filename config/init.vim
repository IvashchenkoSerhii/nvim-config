syntax on

set guicursor=
set noshowmatch
set relativenumber
set hidden
set noerrorbells

set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup

set nohlsearch
set incsearch

set termguicolors
set scrolloff=8

set signcolumn=number

" set cmdheight=0

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" for which-key plugin
set timeoutlen=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set pyx=3 " nvim pythonx
" set clipboard+=unnamedplus " System clipboard, xclip required
set clipboard+=unnamed

set lazyredraw

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/__pycache__/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set wildignore+=**/.vagga/*

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Configure PYTHON
let g:loaded_python_provider = 0  " disable python2
" pyenv install 3.8.1; pyenv virtualenv 3.8.1 nvim3; pyenv activate nvim3
" python -m pip install pynvim flake8 jedi
let g:python3_host_prog = '~/.pyenv/versions/nvim3/bin/python'

""""""""""""""""

let loaded_matchparen = 1
let mapleader = " "

runtime plug.vim

" colorscheme gruvbox
colorscheme sonokai

" set background=light
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" C-L conflicting in netrw, so set it to C-T
nmap <C-T> <Plug>NetrwRefresh
" --
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
inoremap <C-c> <esc>

" delete highlighted text to void register and paste text from clipboard
xnoremap <leader>p "_dP

" ###
" ThePrimeagen https://www.youtube.com/watch?v=hSHATqh8svM
" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap : :<c-g>u
inoremap <CR> <CR><c-g>u


"
" https://vim.fandom.com/wiki/Copy_filename_to_clipboard
" https://stackoverflow.com/a/15020405
" Copy to clipboard current filepath and '::{current_word}' only if
" current_word exists
nmap <leader>cs :let @+ = expand("%") . (getline('.')[col('.')-1] =~# '\k' ? '::' : '') . expand('<cword>')<CR>


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 300})
augroup END


let g:fzf_command_prefix = 'F'

lua << EOF
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = "Open diagnostics quickfix list" })

EOF

"-- close quickfix
nnoremap <Leader>x :cclose<CR>
