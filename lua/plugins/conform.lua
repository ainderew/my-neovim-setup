-- -- handles formatting
-- -- defaults to lsp formatting if not specified
-- return {
--   "stevearc/conform.nvim",
--   event = { "BufReadPre", "BufNewFile" },
--   opts = {
--     formatters_by_ft = {
--       javascript = { "prettier" },
--       typescript = { "eslint_d" },
--       javascriptreact = { "prettier" },
--       typescriptreact = { "prettier" },
--       svelte = { "prettier" },
--       css = { "prettier" },
--       html = { "prettier" },
--       json = { "prettier" },
--       yaml = { "prettier" },
--       markdown = { "prettier" },
--       graphql = { "prettier" },
--       lua = { "stylua" },
--     },
--     formatters = {
--       eslint_d = {
--         command = "eslint_d",
--         args = {
--           "--fix-to-stdout",
--           "--stdin",
--           "--stdin-filename",
--           "$FILENAME",
--           "format",
--           "json",
--
--           "--cache",
--           "--cache-location",
--           ".eslintcache",
--         },
--         stdin = true, -- pipe buffer text (required with --stdin)
--       },
--     },
--   },
-- }
--
-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    --------------------------------------------------------------------
    -- 1 ▪ Per-file-type formatter list
    --    * Prettier FIRST, eslint_d SECOND *
    --------------------------------------------------------------------
    formatters_by_ft = {
      javascript = { "prettier", "eslint_d" },
      typescript = { "eslint_d" },
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
