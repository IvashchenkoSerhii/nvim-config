require'hop'.setup()

vim.keymap.set("n", "<leader>/", "<cmd>HopWord<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "f", "<cmd>HopChar1<cr>",
  {silent = true, noremap = true}
)
