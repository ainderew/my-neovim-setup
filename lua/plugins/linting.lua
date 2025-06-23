-- ~/.config/nvim/lua/plugins/linting.lua
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    -------------------------------------------------------------------------
    -- When to run the linter
    -------------------------------------------------------------------------
    events = { "BufWritePost", "BufReadPost" },

    -------------------------------------------------------------------------
    -- Which linters for which file-types
    -------------------------------------------------------------------------
    linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
  },

  ---------------------------------------------------------------------------
  -- Plugin configuration
  ---------------------------------------------------------------------------
  config = function(_, opts)
    local lint = require("lint")

    -----------------------------------------------------------------------
    -- 1 ▪ Safely obtain the eslint_d linter table
    -----------------------------------------------------------------------
    ---@type lint.Linter|function
    local eslint = lint.linters.eslint_d
    if type(eslint) == "function" then
      eslint = eslint() -- materialise the table
      lint.linters.eslint_d = eslint -- store it back
    end

    -----------------------------------------------------------------------
    -- 2 ▪ Configure eslint_d (STDIN mode + cache + long timeout)
    -----------------------------------------------------------------------
    eslint.args = {
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      "$FILENAME",
      "--cache",
      "--cache-location",
      ".eslintcache",
    }
    eslint.stdin = true -- read buffer via STDIN
    eslint.timeout = 15000 -- 15 s grace for very large TS graphs

    -----------------------------------------------------------------------
    -- 3 ▪ Register file-type mapping & autocmd
    -----------------------------------------------------------------------
    lint.linters_by_ft = opts.linters_by_ft

    vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
