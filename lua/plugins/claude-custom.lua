return {
  -- We override the plugin that the LazyVim extra installed
  {
    "coder/claudecode.nvim", -- (Or "avifenesh/claucode.nvim" depending on the specific extra version)
    opts = {
      -- 1. MOVE TO FLOATING WINDOW
      -- The default is usually "right" or "vertical". Change this to floating.
      window = {
        position = "floating",
        width = 0.8, -- Take up 80% of screen width
        height = 0.8, -- Take up 80% of screen height
        border = "rounded", -- "single" | "double" | "rounded"
        title = " Claude Code Agent ",
        title_pos = "center",
      },

      -- 2. BETTER BEHAVIOR
      -- Auto-save changes so you don't lose context
      auto_save = true,
      -- If true, it opens a native Neovim Diff view when Claude changes code
      -- This is the "Pro" way to review code (Left = Old, Right = New)
      use_native_diff = true,
    },

    -- 3. KEYMAPPINGS
    -- We force the visual mode mapping here
    keys = {
      {
        "<leader>as",
        function()
          -- Get the visual selection
          local mode = vim.fn.mode()
          if mode == "v" or mode == "V" then
            vim.cmd('noau normal! "vy') -- Yank selection to 'v' register
            local selection = vim.fn.getreg("v")

            -- Open Claude (if closed) and paste the selection into the prompt
            vim.cmd("ClaudeCode")

            -- Small delay to let the window open, then paste
            vim.defer_fn(function()
              vim.api.nvim_paste(selection, true, -1)
            end, 100)
          else
            -- If not in visual mode, just open the window
            vim.cmd("ClaudeCode")
          end
        end,
        mode = { "n", "v" }, -- Works in Normal and Visual mode
        desc = "Send Selection to Claude",
      },
    },
  },
}
