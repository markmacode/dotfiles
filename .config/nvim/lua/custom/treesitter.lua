---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "gdscript",
    "godot_resource",
    "javascript",
    "kdl",
    "lua",
    "markdown_inline",
    "python",
    "rust",
    "svelte",
    "typescript",
    "yaml",
  },
  auto_install = true,
  autotag = { enable = true },
  endwise = { enable = true },
  indent = { enable = false },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = { enable = true },
  },
})
