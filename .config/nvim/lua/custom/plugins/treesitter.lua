return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  config = function()
    require("custom.treesitter")
  end,
}
