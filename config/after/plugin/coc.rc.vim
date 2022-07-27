let g:coc_global_extensions = ['coc-pyright', 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-clangd', 'coc-rust-analyzer']
let g:coc_disable_startup_warning = 1 " warning on nvim <0.5

nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)

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

" required Rg https://github.com/BurntSushi/ripgrep#installation
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" write cmd to cmd line and auto press Enter
nnoremap <leader>cr :CocRestart <CR>
nnoremap <leader>cp :CocCommand pyright.restartserver <CR>


" https://vi.stackexchange.com/a/29571
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 3)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 3)\<cr>" : "\<Left>"


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

" https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
