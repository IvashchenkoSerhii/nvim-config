lua << EOF
require'hop'.setup()
EOF

map <leader>/ :HopWord<CR>
nmap <leader>/ :HopWord<CR>
nmap f :HopChar1<CR>
