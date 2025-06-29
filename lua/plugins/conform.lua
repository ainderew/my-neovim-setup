return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    --------------------------------------------------------------------
    -- 1 ▪ Per-file-type formatter list
    --    * Prettier FIRST, eslint_d SECOND *
    --------------------------------------------------------------------
    default_format_opts = {
      timeout_ms = 15000, -- 5 seconds
    },
    formatters_by_ft = {
      javascript = { "prettier", "eslint_d" },
      typescript = { "prettier", "eslint_d" },
      javascriptreact = { "prettier", "eslint_d" },
      typescriptreact = { "prettier", "eslint_d" },

      -- other assets
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
    },

    --------------------------------------------------------------------
    -- 2 ▪  Override the built-in eslint_d formatter
    --------------------------------------------------------------------
    formatters = {
      eslint_d = {
        command = "eslint_d",
        args = {
          "--stdin", -- read buffer text
          "--stdin-filename",
          "$FILENAME", -- correct config resolution
          "--fix-to-stdout", -- send fixed code back
          "--format",
          "json", -- ← add the missing dashes
          "--cache",
          "--cache-location",
          ".eslintcache",
        },
        stdin = true, -- must match --stdin
      },
    },
  },
}
