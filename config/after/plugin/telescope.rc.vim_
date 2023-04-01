if !exists('g:loaded_telescope') | finish | endif


nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>ts <cmd>Telescope grep_string<cr>

" nnoremap \  <cmd>Telescope live_grep<cr>
" nnoremap <C-p> <cmd>Telescope find_files<cr>
" ----------

lua << EOF
local actions = require("telescope.actions")

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF
