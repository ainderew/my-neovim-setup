---@diagnostic disable: undefined-global

-- Enable more aggressive file change detection for Claude Code
vim.api.nvim_create_autocmd(
  { "FocusGained", "TermClose", "TermLeave", "BufEnter", "CursorHold" },
  {
    pattern = "*",
    command = "checktime",
  }
)

-- Notification when file is reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end,
})

-- Reduce CursorHold delay for faster file change detection (100ms)
vim.opt.updatetime = 100
