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



set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Configure PYTHON
let g:loaded_python_provider = 0  " disable python2
" pyenv install 3.8.1; pyenv virtualenv 3.8.1 nvim3; pyenv activate nvim3
" python -m pip install pynvim flake8 jedi
let g:python3_host_prog = '~/.pyenv/versions/nvim3/bin/python'

""""""""""""""""


call plug#begin('~/.vim/plugged')

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git integration
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

" FZF
" install additional:
" for syntax highlight preview: https://github.com/sharkdp/bat
" for Ag: https://github.com/ggreer/the_silver_searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" color scheme
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
" --

Plug 'vim-airline/vim-airline' " footer bar
Plug 'flazz/vim-colorschemes'

Plug 'airblade/vim-gitgutter' " git symbols

Plug 'tpope/vim-commentary' " type: `gcc` for comment line

" jump game. :UpdateRemotePlugins after install. To run :VimBeGood
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}


Plug 'unblevable/quick-scope'  " left-right jumps highlight
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

Plug 'wakatime/vim-wakatime'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" --

call plug#end()


" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" ------------



colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

" NETRW
let g:netrw_browse_split = 4
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
" ----------


" VIM-AIRLINE config
" truncate long branch names to a fixed length >
let g:airline#extensions#branch#displayed_head_limit = 11
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#coc#enabled = 0
" ----------


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" TELESCOPE
lua << EOF
require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>ts <cmd>Telescope grep_string<cr>

" nnoremap \  <cmd>Telescope live_grep<cr>
" nnoremap <C-p> <cmd>Telescope find_files<cr>
" ----------

" FZF
let g:fzf_command_prefix = 'F'
nnoremap <Leader>ff :FGFiles<CR>
nnoremap <Leader>fg :FAg<CR>
nnoremap <Leader>fb :FBuffers<CR>
nnoremap <Leader>fh :FHelptags<CR>
nnoremap <Leader>fm :FMaps<CR>
nnoremap <Leader>fr :FRg<CR>

nnoremap \ :FAg<CR>

nnoremap <C-p> :FGFiles<CR>
nnoremap <A-p> :FFiles<CR>

" ----------


nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" nnoremap <leader>pv :Vexplore<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>


nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>


" for Golang
" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
vnoremap X "_d
inoremap <C-c> <esc>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" COC
let g:coc_global_extensions = ['coc-pyright', 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-clangd', 'coc-rls']
let g:coc_disable_startup_warning = 1 " warning on nvim <0.5

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" nmap <leader>rr <Plug>(coc-rename)  " does not work properly
nmap <leader>rn <Plug>(coc-refactor)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)

" required https://github.com/BurntSushi/ripgrep#installation
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" write cmd to cmd line and auto press Enter
nnoremap <leader>cr :CocRestart <CR>
nnoremap <leader>cp :CocCommand pyright.restartserver <CR>

" FUGITIVE
command Grm :G rebase -i master
command Grh :G rebase -i HEAD~2
command Gpf :G push -f
command Gpm :G checkout master | :G pull | :G checkout -

" right column. gj?
nmap <leader>gh :diffget //3<CR>
" left column. gf?
nmap <leader>gu :diffget //2<CR>

nmap <leader>gs :G<CR><C-w>10_
" ----------
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
