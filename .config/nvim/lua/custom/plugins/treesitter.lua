return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      modules = {},
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "godot_resource",
        "gdscript",
        "go",
        "javascript",
        "kdl",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "svelte",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      ignore_install = {},
      sync_install = false,
      auto_install = true,
      autotag = { enable = true },
      endwise = { enable = true },
      indent = { enable = false },
      highlight = {
        enable = true,
        -- For better performance and making sure there is no conflicts
        -- with highlight grups that interact directly with treesitter.
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
