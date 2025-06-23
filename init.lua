-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")

-- make Neovim’s jobs use a login+interactive Zsh
local zsh = vim.fn.exepath("zsh")
if zsh ~= "" then
  vim.opt.shell = zsh
  vim.opt.shellcmdflag = "-lic"
end
