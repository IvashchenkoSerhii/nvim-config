local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'pyright',
  'tsserver',
  'rust_analyzer',
})

local util = require('lspconfig/util')

-- https://github.com/VonHeikemen/lsp-zero.nvim/issues/195#issuecomment-1490405933
local function get_python_path(workspace)
  local path = util.path
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

require('lspconfig').pyright.setup({
  root_dir = util.root_pattern('.git', '.env'),
  before_init = function(_, config)
    local python_path = get_python_path(config.root_dir)
    config.settings.python.pythonPath = python_path
    -- vim.g.python_host_prog = python_path
    -- vim.g.python3_host_prog = python_path
  end
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- not used by me
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

  -- exactly like defaults
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)

  -- doesn't work?
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

  -- NOTE save all files after renaming
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


vim.keymap.set("n", "<leader>cr", "<cmd>LspRestart<cr>",
  {silent = true, noremap = true}
)
