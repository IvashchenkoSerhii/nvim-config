-- https://github.com/ThePrimeagen/init.lua/blob/master/after/plugin/harpoon.lua
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "Add file to harpoon"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Toggle harpoon quick menu"})

-- vim.keymap.set("n", "<C-a>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-d>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-f>", function() ui.nav_file(4) end)

