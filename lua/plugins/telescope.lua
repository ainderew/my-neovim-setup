return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      path_display = { "smart" }, --"truncate"
      layout_config = {
        vertical = {
          width = 0.9,
          height = 0.95,
          preview_height = 0.5,
        },
      },
    },
    pickers = {
      live_grep = {},
    },
  },
  keys = function(_, keys)
    local builtin = require("telescope.builtin")
    return vim.list_extend(keys, {
      {
        "<leader>fo",
        function()
          builtin.live_grep({ grep_open_files = true })
        end,
        desc = "Live Grep in Open Buffers",
      },
    })
  end,
}
