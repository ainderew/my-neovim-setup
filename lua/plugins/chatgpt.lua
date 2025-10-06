return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("chatgpt").setup({
      -- optional configuration
      -- Chat window / ChatGPTRun
      openai_params = {
        model = "gpt-4o-mini",
        max_tokens = nil, -- make sure this key is absent
        max_completion_tokens = 800, -- use the new key
        temperature = 0.2,
        top_p = 1,
      },

      -- Edit-with-instructions
      openai_edit_params = {
        model = "gpt-4o-mini",
        max_tokens = nil,
        max_completion_tokens = 800,
        temperature = 0.2,
        top_p = 1,
      },
    })
  end,
}
