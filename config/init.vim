syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set termguicolors
set scrolloff=8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set pyx=3 " nvim pythonx
set clipboard+=unnamedplus " System clipboard, xclip required

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

runtime plug.vim

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
vnoremap X "_d
inoremap <C-c> <esc>

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

" ###

"
" https://vim.fandom.com/wiki/Copy_filename_to_clipboard
nmap <leader>cs :let @+=expand("%")<CR>
" nmap <leader>cl :let @*=expand("%:p")<CR>


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" v0.5 required
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 200})
augroup END


" FZF
let g:fzf_command_prefix = 'F'

nnoremap <Leader>ff :FGFiles<CR>
nnoremap <Leader>fb :FBuffers<CR>
nnoremap <Leader>fh :FHelptags<CR>
nnoremap <Leader>fm :FMaps<CR>
nnoremap <Leader>fr :FRg<CR>

" Rg ripgrep (rg) search
nnoremap \ :FRg<Space>

nnoremap <C-p> :FGFiles<CR>

" #####
