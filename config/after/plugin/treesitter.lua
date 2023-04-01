require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "json",
    "yaml",
    "python",
    "css",
    "tsx",
    "html",
    "rust",
  },
  sync_install = false,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  disable = function(lang, buf)
        local max_filesize = 5 * 1024 * 1024 -- 5MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
