-- Automatically detect project root directories based on specific files.
return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      patterns = { ".git", "package.json", ".eslintrc.js", ".eslintrc.json" },
      manual_mode = false,
    })
  end,
}
