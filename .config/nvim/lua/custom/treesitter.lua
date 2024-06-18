---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "gdscript",
    "godot_resource",
    "markdown_inline",
  },
  auto_install = true,
  autotag = { enable = false },
  endwise = { enable = false },
  indent = { enable = false },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = { enable = true },
  },
})
