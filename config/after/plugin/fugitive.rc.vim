if !exists('g:loaded_fugitive') | finish | endif

command Grm :G rebase -i master
command Grh :G rebase -i HEAD~2
command Gpf :G push -f
command Gpm :G checkout master | :G pull | :G checkout -

" open git diff window - <leader>dv
" close diff window - C-w + C-o
" right column.
nmap <leader>gj :diffget //3<CR>
" left column.
nmap <leader>gf :diffget //2<CR>

nmap <leader>gs :G<CR><C-w>10_
