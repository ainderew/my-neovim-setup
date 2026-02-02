---@diagnostic disable: undefined-global

-- Trigger `checktime` when files change on disk
-- This ensures Neovim picks up changes made by Claude Code instantly
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  command = "checktime",
})

-- Notification when file is reloaded (optional quality of life)
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end,
})
