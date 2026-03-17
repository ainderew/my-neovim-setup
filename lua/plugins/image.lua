return {
  {
    "3rd/image.nvim",
    build = false, -- disable luarocks build, we'll use pre-built
    opts = {
      backend = "kitty",
      processor = "magick_cli", -- use imagemagick CLI instead of luarocks magick
      integrations = {
        markdown = { enabled = true },
        neorg = { enabled = false },
      },
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },
}
