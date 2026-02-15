-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- enable spell checker
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Enable automatic file reloading for Claude Code integration
vim.opt.autoread = true

-- make Neovim's jobs use a login+interactive Zsh
local zsh = vim.fn.exepath("zsh")
if zsh ~= "" then
  vim.opt.shell = zsh
  vim.opt.shellcmdflag = "-lic"
end
