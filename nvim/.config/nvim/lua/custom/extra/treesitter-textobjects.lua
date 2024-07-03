-- Another plugin to stop the need for doing a bunch of motions when
-- altering text. For many patterns you can now use a single motion for
-- yanking, deleting or changing blocks of code.
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  branch = "main",
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
    })

    local spec_treesitter = require("mini.ai").gen_spec.treesitter
    require("mini.ai").setup({
      n_lines = 75,
      custom_textobjects = {
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = spec_treesitter({ a = "@call.outer", i = "@call.inner" }),
        d = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
        o = spec_treesitter({
          a = { "@conditional.outer", "@loop.outer" },
          i = { "@conditional.inner", "@loop.inner" },
        }),
      },
    })
  end,
}
