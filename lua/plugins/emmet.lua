local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          capabilities = capabilities,
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
          on_attach = function(client, bufnr)
            -- Set up Ctrl+y , keybinding for Emmet expansion
            vim.keymap.set({ "i", "n" }, "<C-y>,", function()
              -- Trigger nvim-cmp completion
              require("cmp").complete()
            end, { buffer = bufnr, desc = "Trigger Emmet completion" })


          end,
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "emmet-ls")
    end,
  },
}
