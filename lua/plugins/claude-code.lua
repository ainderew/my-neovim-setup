return {
  -- Ensure LSP works well with Claude Code edits
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Increase debounce for better performance with rapid AI edits
      flags = {
        debounce_text_changes = 150,
      },
    },
  },

  -- Better file watching for nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    optional = true,
    opts = {
      view = {
        reload_on_bufenter = true,
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
      },
    },
  },

  -- Better file watching for neo-tree (LazyVim default)
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      filesystem = {
        scan_mode = "deep",
        use_libuv_file_watcher = true,
      },
    },
  },
}
