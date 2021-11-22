if !exists('g:loaded_fugitive') | finish | endif

command Grm :G rebase -i master
command Grh :G rebase -i HEAD~2
command Gpf :G push -f
command Gpm :G checkout master | :G pull | :G checkout -

" right column. gj?
nmap <leader>gh :diffget //3<CR>
" left column. gf?
nmap <leader>gu :diffget //2<CR>

nmap <leader>gs :G<CR><C-w>10_
