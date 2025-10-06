return {
  "nvim-telescope/telescope.nvim",
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
