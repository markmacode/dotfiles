return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  branch = "main",
  config = function()
    local mini = require("mini.ai")
    mini.setup({
      n_lines = 75,
      custom_textobjects = {
        F = mini.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = mini.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
        l = mini.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),
      },
    })

    require("nvim-treesitter-textobjects").setup({
      -- TODO: Text objects. You can also do `swap` and `move` on text objects too
      select = {
        lookahead = true,
      },
    })
  end,
}
