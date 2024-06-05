return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local ai = require("mini.ai")
    require("mini.ai").setup({
      custom_textobjects = {
        F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
        l = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),
      },
    })
    require("mini.basics").setup()
    require("mini.diff").setup({ view = { style = "sign" } })
    require("mini.hipatterns").setup()
    require("mini.indentscope").setup({ symbol = "│" })
    require("mini.hipatterns").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    -- require("mini.surround").setup()
    require("mini.trailspace").setup()
  end,
}
