-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Closes all buffers
vim.keymap.set("n", "<leader>bn", function()
  vim.cmd("bufdo bd")
end, { desc = "Close all buffers" })

-- Adds comma to the end ang opens new line
vim.api.nvim_set_keymap("n", "<leader>c", "A,<Esc>o", { noremap = true, silent = true })

-- Opens a terminal and enters insert mode
vim.api.nvim_set_keymap("n", "<leader>t", ":term<Esc>i", { noremap = true, silent = true, desc = "Open Terminal" })

-- Close terminal buffer and window
vim.api.nvim_set_keymap(
  "n",
  "<leader>zz",
  "<C-\\><C-n>:bd!<CR>",
  { noremap = true, silent = true, desc = "Close Terminal Buffer" }
)

-- To close out of terminal mode in terminal with only escape key
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
