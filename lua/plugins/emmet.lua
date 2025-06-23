return {
  {
    "mattn/emmet-vim",
    config = function()
      -- Emmet configuration for JSX
      vim.g.user_emmet_settings = {
        javascript = {
          extends = "jsx",
        },
        typescript = {
          extends = "tsx",
        },
        typescriptreact = {
          extends = "jsx",
        },
      }

      -- Emmet preferences for JSX/TSX to use className instead of class
      vim.g.user_emmet_mode = "tsx"

      -- Key mappings for Emmet
      vim.api.nvim_set_keymap("i", "<C-y>,", "<Plug>(emmet-expand-abbr)", {})
      vim.api.nvim_set_keymap("n", "<C-y>,", "<Plug>(emmet-expand-abbr)", {})

      -- Filetype detection for JSX/TSX
      vim.cmd([[
        autocmd FileType javascript.jsx EmmetInstall
        autocmd FileType typescriptreact EmmetInstall
      ]])
    end,
  },
}
