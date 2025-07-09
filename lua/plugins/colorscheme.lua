return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    -- Lazy-load the colourscheme only at start-up, not on every :colorscheme
    lazy = false,
    config = function()
      require("onedark").setup({
        style = "deep", -- <- the magic line
        transparent = false, -- set true if you want a transparent bg
        term_colors = true,
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "none",
        },
        diagnostics = { darker = true },
      })
      require("onedark").load()
    end,
  },
  -- { "navarasu/onedark.nvim" },
  --
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "onedark",
  --     transparent = false,
  --
  --     -- styles = {
  --     --   sidebars = "transparent",
  --     --   floats = "transparent",
  --     -- },
  --   },
  -- },
}
