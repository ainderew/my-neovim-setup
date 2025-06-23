local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = false, -- disable vtsls

        tsserver = {
          capabilities = capabilities,
          settings = {},
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            print("[tsserver] attached to buffer", bufnr)
          end,
        },
        --For formatting after prettier, if prettier was set as fomratter in conform
        -- eslint = {
        --   capabilities = capabilities,
        --   settings = {
        --     -- allow the server to format
        --     format = { enable = true },
        --
        --     -- optional: auto-fix on save (we’ll drive this via Conform)
        --     codeActionOnSave = { enable = false },
        --   },
        --   on_attach = function(client)
        --     -- Optional: print when it attaches
        --     print("[eslint-lsp] attached")
        --   end,
        -- },

        -- IDK chat AI hallucinated config
        -- eslint = {
        --   capabilities = capabilities,
        --   on_attach = function(client, bufnr)
        --     -- 🔥 Disable formatting in eslint-lsp
        --     -- client.server_capabilities.documentFormattingProvider = false
        --     -- client.server_capabilities.documentRangeFormattingProvider = false
        --     -- print("[eslint-lsp] attached to buffer (formatting disabled)", bufnr)
        --   end,
        --   settings = {
        --     -- Optional: keep your original settings
        --     codeAction = {
        --       disableRuleComment = { enable = true, location = "separateLine" },
        --       showDocumentation = { enable = true },
        --     },
        --     format = false, -- Optional: also disable in settings
        --     validate = "on",
        --   },
        -- },
      },
    },
  },
}
