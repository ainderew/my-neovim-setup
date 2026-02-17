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

-- Open image files with viu, outputting directly to iTerm2
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.bmp", "*.ico" },
  callback = function(args)
    local file = vim.fn.fnamemodify(args.file, ":p")
    vim.cmd("bdelete!")
    vim.cmd("silent !viu " .. vim.fn.shellescape(file))
  end,
})

-- Disable LSP diagnostics in terminal buffers (prevents underlines in Claude Code)
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})
