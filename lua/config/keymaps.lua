-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Closes all buffers
vim.keymap.set("n", "<leader>bn", "<cmd>%bd|e#<cr>", { desc = "Buffers › delete all but current" })

-- Adds comma to the end and opens new line
vim.keymap.set("n", "<leader>c", "A,<Esc>o", { desc = "Add comma and new line" })

-- Opens a terminal and enters insert mode
vim.keymap.set("n", "<leader>T", ":term<Esc>i", { desc = "Open Terminal" })

-- Close terminal buffer and window
vim.keymap.set("n", "<leader>zz", "<C-\\><C-n>:bd!<CR>", { desc = "Close Terminal Buffer" })

-- To close out of terminal mode in terminal with only escape key
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Gitlab MRs
vim.keymap.set("n", "<leader>ml", ":GitLabListMRs<CR>", { desc = "List GitLab MRs" })
vim.keymap.set("n", "<leader>ma", ":GitLabApprove<CR>", { desc = "Approve MR" })
vim.keymap.set("n", "<leader>mr", ":GitLabRevoke<CR>", { desc = "Revoke Approval" })
vim.keymap.set("n", "<leader>mc", ":GitLabComment<CR>", { desc = "Comment on MR" })

-- Neotest
vim.keymap.set("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run file tests" })
vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { desc = "Show test output" })

-- Claude Code integration helpers
vim.keymap.set("n", "<leader>ar", "<cmd>checktime<cr>", { desc = "AI › reload buffers" })
vim.keymap.set("n", "<leader>aw", "<cmd>w<cr>", { desc = "AI › save for Claude" })
