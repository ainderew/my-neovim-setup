return {
  -- Claude Code terminal integration
  {
    "coder/claudecode.nvim",
    opts = {
      -- Auto-focus Claude terminal after sending selection/buffer
      focus_after_send = true,
      -- Diff review in new tab to avoid cluttering workspace
      diff_opts = {
        open_in_new_tab = true,
        hide_terminal_in_new_tab = true,
      },
    },
  },

  -- Increase LSP debounce for better performance with rapid AI edits
  {
    "neovim/nvim-lspconfig",
    opts = {
      flags = {
        debounce_text_changes = 150,
      },
    },
  },
}
